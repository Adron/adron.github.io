---
title: Setting up an AWS SQS Queue for Use With Node.js Beanstalk Worker Instances
author: Adron Hall
date: 2014-11-06
template: article.jade
---
* *Part 1* – [Setting up an AWS SQS Queue for Use With Node.js Beanstalk Worker Instances](http://compositecode.com/2014/11/06/setting-up-an-aws-sqs-queue-for-use-with-node-js-beanstalk-worker-instances) (This is the current article you're reading now)
* *Part 2* – [Setting up a Hapi.js App that sends work to a Node.js AWS Worker via SQS](http://compositecode.com/2014/11/07/hapijs-aws-worker-publish/)
* *Part 3* – [AWS Beanstalk Worker with Node.js and SQS](http://compositecode.com/2014/11/19/aws-beanstalk-worker-with-node-js-and-sqs/)

Before diving straight in, I'm going to outline the specific goals and what I am using to accomplish these goals. The goal is to have a simple web application, that will get some element of data posted to a queue. The queue will then have data that a worker service needs to then process. As I step through each of these requirements I'll determine the actual push and pull mechanisms that will get the job done.

<span class="more"></span>

<strong><a href="http://aws.amazon.com/elasticbeanstalk/"><img class="alignright" src="http://photos.adron.me/Software/Software-Development/AWS-SQS/i-rnt9WWX/0/O/Deployment-%26-Management_Elastic-Beanstalk_200x200.png" alt="AWS" width="200" height="200" /></a>AWS Elastic Beanstalk Worker</strong>

[AWS Elastic Beanstalk](http://aws.amazon.com/elasticbeanstalk/) is a service used to deploy and scale web application and services. In this particular example I'll be using Node.js for all the work, but other options are available such as Java, .NET, PHP, Python, Ruby and even anything you can stick in a Docker Container. Simply put, you can run whatever you need in Beanstalk and gain all the advantages of the virtualized services and scaling of the toolset.

The worker feature that I'll be using in this how-to, referred to by AWS as Worker Tiers, is setup to handle background tasks at scale. Think of things like doing database cleanup, setting action flags, events, firing triggers or simply sending an email notification. The worker tier that I'll be using, again with Node.js, will simple be there to process messages that I'll put into the queue.

<div class="image float-right">
    ![SQS](Amazon-SQS_200x200.png)
</div>

[AWS Simple Queue Service (SQS)](http://aws.amazon.com/sqs/)

[AWS Simple Queue Service](http://aws.amazon.com/sqs/), or [SQS](http://aws.amazon.com/sqs/) for short, is a distributed and scalable hosted queue service for storing messages that need to be reliably available between systems. By using SQS I can then create decoupled components of an application that are autonomous of each other in execution. This provides more options around scaling up or scaling down particular workloads, apps and services throughout the application ecosystem that I've built.

<strong><a href="http://aws.amazon.com/cloudwatch/"><img class="alignright" src="http://photos.adron.me/Software/Software-Development/AWS-SQS/i-Z5FZZrj/0/O/Deployment-%26-Management_CloudWatch-200x200.png" alt="" width="200" height="200" /></a>CloudWatch</strong>

Even though the use of <a href="http://aws.amazon.com/cloudwatch/" target="_blank">CloudWatch</a> is actually transparent to this project, I needed to bring it up, because without things being setup appropriately CloudWatch will definitely let you know that it is involved in this architecture.

CloudWatch is a monitoring service for cloud resources. In this particular scenario that I'm detailing here it is setup automatically by Elastic Beanstalk to monitor and autoscale instances as demand dictates.

<strong><a href="http://aws.amazon.com/iam/"><img class="alignright" src="http://photos.adron.me/Software/Software-Development/AWS-SQS/i-fgXQLwK/0/O/Deployment-%26-Management_IAM-200x200.png" alt="" width="200" height="200" /></a>Identity and Access Management (IAM)</strong>

<a href="http://aws.amazon.com/iam/" target="_blank">AWS IAM</a> provides security for individual AWS resources and also a way to manage users and administrators of those resources. In this particular scenario I won't cover the default user that I have setup, but assume that I'm using a user with permissions to all resources. I will be adding some roles to enable CloudWatch and Elastic Beanstalk to interoperate appropriately with the SQS under the premise of an Elastic Beanstalk Worker environment.

<strong><a href="http://aws.amazon.com/sdk-for-node-js/"><img class="alignright" src="http://photos.adron.me/Software/Software-Development/AWS-SQS/i-8XL8hdw/0/O/SDKs-copy_nodeJS-200x2100.png" alt="" width="200" height="200" /></a>AWS Node.js SDK</strong>

The <a href="http://aws.amazon.com/sdk-for-node-js/" target="_blank">Nodejs SDK</a> that Amazon provides for the AWS Web Services is pretty extensive. I have noticed it suffers a little from the "<em><a href="http://en.wikipedia.org/wiki/God_object" target="_blank">God Object</a></em>" type of context where it does everything in one giant library, <em>however</em>, it really kind of makes sense for something like AWS's Services.

The SDK provides JavaScript objects for AWS services including S3, EC2, and almost every other practical service they have. The package is available for download the standard npm way.

[sourcecode language="bash"]
npm install aws-sdk
[/sourcecode]

In the getting started section of the AWS documentation, the samples are generally given using a loadable json file with the secret key information for connecting to your AWS resources. In this scenario I'll actually use a different way to setup that configuration, which I'll elaborate on further into this series.
<h2>Back to Business</h2>
The first order of business is to get a queue created. Since everything I'm going to put together in this sample is primarily focused around processing a queue, it seems like the perfect place to start. First open up the AWS Console and navigate to the SQS admin page.

[caption id="" align="aligncenter" width="800"]<a href="http://photos.adron.me/Software/Software-Development/AWS-SQS/i-BSk8CrF/0/O/editthis.png"><img class="" src="http://photos.adron.me/Software/Software-Development/AWS-SQS/i-BSk8CrF/0/L/editthis-L.png" alt="SQS - Message Queue Service (Click for full size image)" width="800" height="432" /></a> SQS - Message Queue Service (Click for full size image)[/caption]

Next click on the Create New Queue button to launch the create queue dialog.

[caption id="" align="aligncenter" width="800"]<a href="http://photos.adron.me/Software/Software-Development/AWS-SQS/i-2Q4XhPR/0/O/SQS_Worker_02.png"><img class="" src="http://photos.adron.me/Software/Software-Development/AWS-SQS/i-2Q4XhPR/0/L/SQS_Worker_02-L.png" alt="Create New Queue (Click for full size image)" width="800" height="212" /></a> Create New Queue (Click for full size image)[/caption]

On the dialog enter the queue name and change any of the queue settings that you need to. In this particular situation I didn't change any and just went with the defaults.

[caption id="" align="aligncenter" width="654"]<a href="http://photos.adron.me/Software/Software-Development/AWS-SQS/i-9jMswFx/0/O/SQS_Worker_03.png"><img class="" src="http://photos.adron.me/Software/Software-Development/AWS-SQS/i-9jMswFx/0/L/SQS_Worker_03-L.png" alt="Create New Queue Dialog (Click for full size image)" width="654" height="600" /></a> Create New Queue Dialog (Click for full size image)[/caption]

Now the queue is created. However I can't really do anything with it at this point. I need to open up permissions to whatever I want to have access it. Clicking on the just created queue and then selecting the Permissions tab just below that will bring up the tab dialog that provides options for adding various permission levels for access.

[caption id="" align="aligncenter" width="800"]<a href="http://photos.adron.me/Software/Software-Development/AWS-SQS/i-VLVLhgZ/0/O/SQS_Worker_04.png"><img class="" src="http://photos.adron.me/Software/Software-Development/AWS-SQS/i-VLVLhgZ/0/L/SQS_Worker_04-L.png" alt="Queues (Click for full size image)" width="800" height="592" /></a> Queues (Click for full size image)[/caption]

Adding permissions...

[caption id="" align="aligncenter" width="800"]<a href="http://photos.adron.me/Software/Software-Development/AWS-SQS/i-6hnvB7z/0/O/SQS_Worker_06.png"><img class="" src="http://photos.adron.me/Software/Software-Development/AWS-SQS/i-6hnvB7z/0/L/SQS_Worker_06-L.png" alt="Adding Permissions (Click for full size image)" width="800" height="263" /></a> Adding Permissions (Click for full size image)[/caption]

Add a Permission to sample

[caption id="" align="aligncenter" width="756"]<a href="http://photos.adron.me/Software/Software-Development/AWS-SQS/i-52Cc96V/0/O/SQS_Worker_07.png"><img class="" src="http://photos.adron.me/Software/Software-Development/AWS-SQS/i-52Cc96V/0/O/SQS_Worker_07.png" alt="Add a Permission to sample" width="756" height="628" /></a> Add a Permission to sample[/caption]

The queue is now all setup. In the next entry I'll setup a web application project that will send data to the queue. I'll also update this article with the links to the subsequent articles at the very top - and the bottom of the article here.

	<em>Part 1</em> – <a href="http://compositecode.com/2014/11/06/setting-up-an-aws-sqs-queue-for-use-with-node-js-beanstalk-worker-instances">Setting up an AWS SQS Queue for Use With Node.js Beanstalk Worker Instances</a> (This is the current article you're reading now)</li>
	<em>Part 2</em> – <a href="http://compositecode.com/2014/11/07/hapijs-aws-worker-publish/">Setting up a Hapi.js App that sends work to a Node.js AWS Worker via SQS</a></li>
	<em>Part 3</em> – <a href="http://compositecode.com/2014/11/19/aws-beanstalk-worker-with-node-js-and-sqs/">AWS Beanstalk Worker with Node.js and SQS</a></li>

<strong>Reference:</strong>

	<a href="https://github.com/Adron/testing-aws-sqs-worker" target="_blank">Testing AWS SQS Web Worker Github Repo</a></li>
	<a href="https://github.com/Adron/testing-aws-sqs-site" target="_blank">Testing AWS SQS Web App Github Repo</a></li>
