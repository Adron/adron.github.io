---
title: AWS Beanstalk Worker with Node.js and SQS
author: Adron Hall
date: 2014-11-19
template: article.jade
---
<div class="image float-right">
    ![Amazon SQS](amazon-sqs_200x200.png)
</div>

* *Part 1* – [Setting up an AWS SQS Queue for Use With Node.js Beanstalk Worker Instances](/articles/setting-up-an-aws-sqs-queue-for-use-with-node-js-beanstalk-worker-instances)
* *Part 2* – [Setting up a Hapi.js App that sends work to a Node.js AWS Worker via SQS](/articles/hapijs-aws-worker-publish/)
* *Part 3* – [AWS Beanstalk Worker with Node.js and SQS](/articles/aws-beanstalk-worker-with-node-js-and-sqs/) (This is the current article you're reading now)

First I created a project for the node.js worker. The first steps for this are identical to that of creating the Hapi.js site that publishes messages to the queue. Go through these three steps for the worker and then I'll continue from there.

* First [create the web application](/articles/hapijs-aws-worker-publish#webapplication) which will act as our worker service. I gave mine the name of [testing-aws-sqs-worker](https://github.com/Adron/testing-aws-sqs-worker), the site publishing to the queue I called [testing-aws-sqs-site](https://github.com/Adron/testing-aws-sqs-site).
* Next [add dependencies needed](/articles/hapijs-aws-worker-publish/#mocha), like mocha.
* Finally make sure the [AWS environment variables](/articles/hapijs-aws-worker-publish/#aws) are set appropriately.

*...and now on to the security, configuration and worker specific parts of this series...*

<span class="more"></span>

<strong>Security Needs</strong>

Before getting the actual worker setup I need to have a role setup in IAM (

[caption id="" align="aligncenter" width="800"]<a href="http://photos.adron.me/Software/Software-Development/AWS-SQS/i-Q2XDLK7/0/L/WorkerRunning04-O.png"><img class="" src="http://photos.adron.me/Software/Software-Development/AWS-SQS/i-Q2XDLK7/0/L/WorkerRunning04-L.png" alt="Identity and Access Management (Click for full size image)" width="800" height="582" /></a> Identity and Access Management (Click for full size image)[/caption]

Once here click on the Roles section of IAM. Then click on Create New Role.

[caption id="" align="aligncenter" width="800"]<a href="http://photos.adron.me/Software/Software-Development/AWS-SQS/i-tsXH5S6/0/O/WorkerRunning05.png"><img class="" src="http://photos.adron.me/Software/Software-Development/AWS-SQS/i-tsXH5S6/0/L/WorkerRunning05-L.png" alt="Click on Roles and then Create New Role (Click for full size image)" width="800" height="306" /></a> Click on Roles and then Create New Role (Click for full size image)[/caption]

Next set the role name.

[caption id="" align="aligncenter" width="1014"]<a href="http://photos.adron.me/Software/Software-Development/AWS-SQS/i-BwbZjWv/0/O/WorkerRunning06.png"><img class="" src="http://photos.adron.me/Software/Software-Development/AWS-SQS/i-BwbZjWv/0/O/WorkerRunning06.png" alt="Set Role Name (Click for full size image)" width="1014" height="318" /></a> Set Role Name (Click for full size image)[/caption]

Now select Amazon EC2 here. I noted this wasn't immediately intuitive. But once I realized that the security item I'm looking for is a sub-item under Amazon EC2 things made more sense.

[caption id="" align="aligncenter" width="800"]<a href="http://photos.adron.me/Software/Software-Development/AWS-SQS/i-w2T6fxZ/0/O/WorkerRunning07.png"><img class="" src="http://photos.adron.me/Software/Software-Development/AWS-SQS/i-w2T6fxZ/0/L/WorkerRunning07-L.png" alt="Selecting Role Type. (Click for full size image)" width="800" height="502" /></a> Selecting Role Type. (Click for full size image)[/caption]

Next next odd thing that occurred in this web wizard was that the number 3 step is skipped. Again, that took me a second to realize maybe that's an optional step. Whatever the case, it shouldn't be displayed unless it's a step that might actually occur in all paths, otherwise just make it disappear. Anyway, step 4 is where the next step awaits.

[caption id="" align="aligncenter" width="1021"]<a href="http://photos.adron.me/Software/Software-Development/AWS-SQS/i-ppBdPKw/0/O/WorkerRunning08.png"><img class="" src="http://photos.adron.me/Software/Software-Development/AWS-SQS/i-ppBdPKw/0/O/WorkerRunning08.png" alt="Custom Policy (Click for full size image)" width="1021" height="749" /></a> Custom Policy (Click for full size image)[/caption]

[caption id="" align="aligncenter" width="1023"]<a href="http://photos.adron.me/Software/Software-Development/AWS-SQS/i-zgj9ZVs/0/O/WorkerRunning09.png"><img class="" src="http://photos.adron.me/Software/Software-Development/AWS-SQS/i-zgj9ZVs/0/O/WorkerRunning09.png" alt="Select Custom Policy to Enter Policy (Click for full size image)" width="1023" height="748" /></a> Select Custom Policy to Enter Policy (Click for full size image)[/caption]

The next step I'll add the JSON that defines this role. It looks like this in the wizard (and I've included the actual JSON just below the image of the wizard). NOTE: In this screen shot I've named the role one thing, but when I select it below I've actually renamed it to "serverComms". These two are indeed the same role, I just didn't want to go back and redo all the screenshots around a minor rename. :)

[caption id="" align="aligncenter" width="1020"]<a href="http://photos.adron.me/Software/Software-Development/AWS-SQS/i-Wvbtkd8/0/O/WorkerRunning10.png"><img class="" src="http://photos.adron.me/Software/Software-Development/AWS-SQS/i-Wvbtkd8/0/O/WorkerRunning10.png" alt="Setting Permissions (Click for full size image)" width="1020" height="752" /></a> Setting Permissions (Click for full size image)[/caption]

[sourcecode language="javascript"]
{
  &quot;Version&quot;: &quot;2012-10-17&quot;,
  &quot;Statement&quot;: [
    {
      &quot;Sid&quot;: &quot;QueueAccess&quot;,
      &quot;Action&quot;: [
        &quot;sqs:ChangeMessageVisibility&quot;,
        &quot;sqs:DeleteMessage&quot;,
        &quot;sqs:ReceiveMessage&quot;
      ],
      &quot;Effect&quot;: &quot;Allow&quot;,
      &quot;Resource&quot;: &quot;*&quot;
    },
    {
      &quot;Sid&quot;: &quot;MetricsAccess&quot;,
      &quot;Action&quot;: [
        &quot;cloudwatch:PutMetricData&quot;
      ],
      &quot;Effect&quot;: &quot;Allow&quot;,
      &quot;Resource&quot;: &quot;*&quot;
    }
  ]
}
[/sourcecode]

Click next and the summary is provided before final creation of the role.

[caption id="" align="aligncenter" width="1024"]<a href="http://photos.adron.me/Software/Software-Development/AWS-SQS/i-X3FPN2L/0/O/WorkerRunning11.png"><img class="" src="http://photos.adron.me/Software/Software-Development/AWS-SQS/i-X3FPN2L/0/O/WorkerRunning11.png" alt="Create Role (Click for full size image)" width="1024" height="410" /></a> Create Role (Click for full size image)[/caption]

<strong>Web Worker Application</strong>

The first thing I need is to go ahead and get the worker setup in the AWS Management Console. I create a new environment by clicking on Launch New Environment.

[caption id="" align="aligncenter" width="800"]<a href="http://photos.adron.me/Software/Software-Development/AWS-SQS/i-64KN6hx/0/O/WorkerRunning01.png"><img class="" src="http://photos.adron.me/Software/Software-Development/AWS-SQS/i-64KN6hx/0/L/WorkerRunning01-L.png" alt="Launch New Environment (Click for full size image)" width="800" height="543" /></a> Launch New Environment (Click for full size image)[/caption]

Next up is setting the environment tier and type and the configuration. I set these to Worker, Node.js, and Load Balanced.

[caption id="" align="aligncenter" width="800"]<a href="http://photos.adron.me/Software/Software-Development/AWS-SQS/i-V3BkB8M/0/L/WorkerRunning02-O.png"><img class="" src="http://photos.adron.me/Software/Software-Development/AWS-SQS/i-V3BkB8M/0/L/WorkerRunning02-L.png" alt="Set Environment Tier, Configuration and Environment Type (Click for full size image)" width="800" height="426" /></a> Set Environment Tier, Configuration and Environment Type (Click for full size image)[/caption]

Then upload the project zip file. I zipped and uploaded this file <a href="http://compositecode.com/2014/11/07/hapijs-aws-worker-publish/#upload" target="_blank">similarly to the way I did the site for submitting messages to the queue</a>. To see what code I'm uploading - the blog entry is kind of circular - so I added the code part toward the bottom of this entry. For the exact code, check out the later part of the entry and the finished code here in the <a href="https://github.com/Adron/testing-aws-sqs-worker" target="_blank">github repo</a>.

[caption id="" align="aligncenter" width="800"]<a href="http://photos.adron.me/Software/Software-Development/AWS-SQS/i-DM9Ftnh/0/O/WorkerRunning03.png"><img class="" src="http://photos.adron.me/Software/Software-Development/AWS-SQS/i-DM9Ftnh/0/L/WorkerRunning03-L.png" alt="Upload a zip. (Click for full size)" width="800" height="586" /></a> Upload a zip. (Click for full size)[/caption]

Now click next through environment info and additional resources. In configuration details the main thing I need is to select the IAM security role for the instance being created.

[caption id="" align="aligncenter" width="611"]<a href="http://photos.adron.me/Software/Software-Development/AWS-SQS/i-prgHCRf/0/O/WorkerRunning12.png"><img class="" src="http://photos.adron.me/Software/Software-Development/AWS-SQS/i-prgHCRf/0/L/WorkerRunning12-L.png" alt="Selecting the security role. (Click for full size image)" width="611" height="600" /></a> Selecting the security role. (Click for full size image)[/caption]

Click through the environment variables and on to Worker Details. Here I select the queue that I created in <a href="http://compositecode.com/2014/11/06/setting-up-an-aws-sqs-queue-for-use-with-node-js-beanstalk-worker-instances/">part 1 of this series</a>. Just below that enter the URI end point that the worker will provide the queue to send messages via POST. I'll get to the code later in this article. But for now, I just selected /hi as the end point.

[caption id="" align="aligncenter" width="1017"]<a href="http://photos.adron.me/Software/Software-Development/AWS-SQS/i-mcG586C/0/O/WorkerRunning13.png"><img class="" src="http://photos.adron.me/Software/Software-Development/AWS-SQS/i-mcG586C/0/O/WorkerRunning13.png" alt="Worker Details (Click for full size image)" width="1017" height="472" /></a> Worker Details (Click for full size image)[/caption]

Finally, the last step is to review and Launch the worker instance.

[caption id="" align="aligncenter" width="458"]<a href="http://photos.adron.me/Software/Software-Development/AWS-SQS/i-nTDBnSs/0/O/WorkerRunning14.png"><img class="" src="http://photos.adron.me/Software/Software-Development/AWS-SQS/i-nTDBnSs/0/L/WorkerRunning14-L.png" alt="Launch (Click for full size image)" width="458" height="600" /></a> Launch (Click for full size image)[/caption]

<strong>Codes</strong>

At this point I'll still be using hapi.js and good.js, so I follow the installation of these libraries similar to the ones I used for the site app in <a href="http://compositecode.com/2014/11/07/hapijs-aws-worker-publish/">part 2 of this series</a>.

[sourcecode language="bash"]
npm install hapi --save
npm install good --save
[/sourcecode]

Now, I've setup a <a href="https://github.com/Adron/testing-aws-sqs-worker/blob/master/server.js" target="_blank">*server.js*</a> as shown below. This API end point provides an action, in this case a write to the log, and then just finishes. This will prove out a complete movement of message from publisher site to queue to answering worker service.

[sourcecode language="javascript"]
var
  AWS = require('aws-sdk'),
  awsRegion = 'us-west-2',
  sqs = {},
  Hapi = require('hapi'),
  Good = require('good'),
  queueUri = 'https://sqs.us-west-2.amazonaws.com/621392439615/sample';

var server = new Hapi.Server(process.env.PORT || 3000);

server.route({
  method: 'POST',
  path: '/hi',
  handler: function (request, reply) {
    AWS.config.update({
      accessKeyId: process.env.AWS_ACCESS_KEY_ID,
      secretAccessKey: process.env.AWS_SECRET_KEY,
      region: awsRegion
    });
    sqs = new AWS.SQS();

    server.log('response: ', request.payload.name);
    server.log('Starting receive message.', '...a 200 response should be received.');

    reply();
  }
});

server.pack.register(Good, function (err) {
  if (err) {
    throw err;
  }

  server.start(function () {
    server.log('info', 'Server running at: ' + server.info.uri);
  });
});
[/sourcecode]

In this code, note that Hapi.js takes the request (read more on <a href="http://hapijs.com/" target="_blank">Hapi.js here</a>) and sticks the body of the request in the property payload. Since AWS SQS sends across JSON in the way I've set it up (see <a href="http://compositecode.com/2014/11/06/setting-up-an-aws-sqs-queue-for-use-with-node-js-beanstalk-worker-instances/" target="_blank">part 1</a> and <a href="http://compositecode.com/2014/11/07/hapijs-aws-worker-publish/" target="_blank">part 2</a>) the received message coming in looks like this.

[sourcecode language=""]
{&quot;name&quot;:&quot;April&quot;}
[/sourcecode]

In the above code, the request.payload.name code gives us the name April. Run this and when the SQS receives input to process it will immediately send the message to the worker which will then process the code. When the worker returns a 200, the message is marked complete and removed from the queue. When I navigate to the nodejs.log in the AWS Beanstalk logs section of the environment, I get the last few items that I submitted to the queue for processing. The code above responds as shown below in the log.

[sourcecode language="bash"]
-------------------------------------
/var/log/nodejs/nodejs.log
-------------------------------------
141119/011034.709, response: , Susan
141119/011034.709, Starting receive message., ...a 200 response should be received.
141119/011034.688, request, http://ip-172-31-33-151:8081: [1;33mpost[0m /hi {} [32m200[0m (26ms)
141119/011039.927, response: , April
141119/011039.928, Starting receive message., ...a 200 response should be received.
141119/011039.925, request, http://ip-172-31-33-151:8081: [1;33mpost[0m /hi {} [32m200[0m (6ms)
141119/011045.232, response: , Jessica
141119/011045.232, Starting receive message., ...a 200 response should be received.
141119/011045.229, request, http://ip-172-31-33-151:8081: [1;33mpost[0m /hi {} [32m200[0m (7ms)
[/sourcecode]

BOOM! All done. A few notes before I end this entry though. Note that with the worker feature being used for Beanstalk and SQS there really isn't much code that is needed on the receipt end of the worker. I merely needed to respond 200, to complete the request from the point of view of the SQS worker service. Then whatever code I have that I want to act on the process with can work on the data received in the body from the queue. More than a few examples out there don't really show this, but instead show the manual way of writing code that will poll and act upon the messages in the queue. The Beanstalk worker configuration is dramatically simpler in comparison to this practice. If you do want to read more about manually polling and acting on the data check out "<a href="https://milesplit.wordpress.com/2013/11/07/using-sqs-with-node/" target="_blank">Using SQS With Node</a>", it's the only end-to-end example I've seen with Node.js being used. There is also of course the documentation, but it doesn't provide clear cut examples of what exactly a good practice around working with the queue and requires a lot of RTFMing which quit frankly is a TLDR; scenario for doing something like this.

Hope this blog post is helpful in getting Node.js working with the worker role. If you have any questions, comments or it appears I've missed a step, let me know and I'll edit this and the related posts to make sure they're as accurate and as simple to follow as I can get them.

Cheers!

<hr />

<ul>
	<li>*Part 1* – <a href="http://compositecode.com/2014/11/06/setting-up-an-aws-sqs-queue-for-use-with-node-js-beanstalk-worker-instances">Setting up an AWS SQS Queue for Use With Node.js Beanstalk Worker Instances</a>
	<li>*Part 2* – <a href="http://compositecode.com/2014/11/07/hapijs-aws-worker-publish/">Setting up a Hapi.js App that sends work to a Node.js AWS Worker via SQS</a>
	<li>*Part 3* – <a href="http://compositecode.com/2014/11/19/aws-beanstalk-worker-with-node-js-and-sqs/">AWS Beanstalk Worker with Node.js and SQS</a> (This is the current article you're reading now)
</ul>
<strong>Reference:</strong>
<ul>
	<li><a href="https://github.com/Adron/testing-aws-sqs-worker" target="_blank">Testing AWS SQS Web Worker Github Repo</a>
	<li><a href="https://github.com/Adron/testing-aws-sqs-site" target="_blank">Testing AWS SQS Web App Github Repo</a>
</ul>
