---
title: __3 "Going the Full Mile, Continuous Delivery."
author: Adron Hall
date: 2015-09- 01:04:28
template: article.jade
---
In the last few issues of this series, the team has done the following:

1. [Introducing the Thrashing Code Team & Projects](/articles/introducing-the-thrashing-code-team-and-projects/) - Know who's working on what and what the projects are.

2. "<a href="http://compositecode.wordpress.com/2015/04/07/__1-getting-started-kanban-first-steps-for-a-sharing-app/">Getting Started, Kanban & First Steps for a Sharing App</a>" - Getting the kanban put together and the team involved.</li>

3. "<a href="http://compositecode.wordpress.com/2015/04/08/__2-got-our-kanban-lets-start-a-basic-loopback-api/">Starting a Basic Loopback API & Continuous Integration</a>" - Getting the skeleton of the API application setup and the continuous integration services running.

In this issue of the series Keartida is continuing with setup and configuration of the next step, getting to a basic continuous delivery of services with a basic AWS Elastic Beanstalk setup.

<span class="more"></span>

## AWS Elastic Beanstalk

Let's talk a little bit about the solutions and working with teams in the solutions before diving into Keartida's efforts. With each of the SaaS solutions that I've pointed out in the last couple of entries each has a specific connection, integration, or reliance on Github. This is, of course perfect so that each part works seamlessly together. AWS has it's own user management system which also needs to be taken into account.

<h2>In CodeShip</h2>

It's easy to add members to a build, which I covered in the <a href="http://compositecode.wordpress.com/2015/04/08/__2-got-our-kanban-lets-start-a-basic-loopback-api/">previous entry in this series</a>.

<h2>In Waffle.io</h2>

Waffle.io actually is pretty simple. Simply sign in with your github account and you're in with an account. But to access certain projects one does have to setup and share the respective kanban boards. The way to do this with Waffle.io is to actually setup users based on the github permissions setup for the user for the particular project.

<h2>In AWS</h2>

To get users setup in AWS is a little differently. What we need to setup a full build and delivery of the application to AWS is to get the user's key pair. Let's take a look at setting up a <em>group</em> and a <em>user</em> in Amazon for this purpose. In this case I am going to create a user for deployment purposes.

On the main AWS Dashboard here, click on <em>Identity & Access Management</em>.

<img src="http://photos.adron.me/Software/Software-Development/Work-Flow-of-JavaScript/i-kTRDb7N/0/L/AWS_Management_Console-L.png" alt="AWS" width="800" height="577" />

On that page there are several options listed on the left hand side. Click on the <em>Groups</em> and then click on the <em>Create New Group</em> button. After that a wizard will come up.

<img src="http://photos.adron.me/Software/Software-Development/Work-Flow-of-JavaScript/i-WNbhDjT/0/L/IAM_Management_Console_01-L.png" alt="Groups" width="800" height="263" />

Enter the group name and click next.

<img src="http://photos.adron.me/Software/Software-Development/Work-Flow-of-JavaScript/i-t4fHMQ8/0/L/IAM_Management_Console_02-L.png" alt="Group Name" width="800" height="545" />

In the Attach Policy step, slect the S3 Full Access and Elastic Beanstalk Full Access policies for this account.

<img src="http://photos.adron.me/Software/Software-Development/Work-Flow-of-JavaScript/i-mCLGMwG/0/L/IAM_Management_Console_04-L.png" alt="Selecting Policies" width="800" height="541" />

Once the appropriate polices are selected to be attached, click on next step, review and then add the group. Then select the group that was just created and click on the

<img src="http://photos.adron.me/Software/Software-Development/Work-Flow-of-JavaScript/i-NvP2v8w/0/L/IAM_Management_Console_06-L.png" alt="Add Users to Group" width="800" height="452" />

Once the appropriate user is added, then the parts to wrap up the delivery part of the deployment are all set. Back to what Keartida was working on!

<h2>Keartida Deploys coder-swap</h2>

First step, Keartida logged into the AWS management console.

<img src="http://photos.adron.me/Software/Software-Development/Work-Flow-of-JavaScript/i-wds45X3/0/L/AWS%20-%20Elastic%20Beanstalk%2001-L.png" alt="AWS Management Console" width="791" height="600" />

Since this is the first Elastic Beanstalk Application that Keartida has deployed, when she clicks on Elastic Beanstalk this screen appears.

<img src="http://photos.adron.me/Software/Software-Development/Work-Flow-of-JavaScript/i-BFx2kdV/0/L/AWS%20-%20Elastic%20Beanstalk%2002-L.png" alt="Welcome to Elastic Beanstalk" width="791" height="600" />

From here, she selected Node.js from the drop down and Launch Now. From there a quick wizard appears and let her enter the name of the application and a description.

<img class="" src="http://photos.adron.me/Software/Software-Development/Work-Flow-of-JavaScript/i-qQS5rpx/0/O/AWS%20-%20Elastic%20Beanstalk%2004.png" alt="Creating the first Node.js Application" width="960" height="728" />

The application starts being created.

<img src="http://photos.adron.me/Software/Software-Development/Work-Flow-of-JavaScript/i-sFFk5Qq/0/O/AWS%20-%20Elastic%20Beanstalk%2003%20-%20Broken%20EBS.png" alt="Creating the Application." width="960" height="728" />

When this is created, the funny thing is the wizard creates a application environment name that causes problems. Keartida and I found this out the hard way, and figured out it is best to just delete this application and create an application and an environment name that works better.

<img src="http://photos.adron.me/Software/Software-Development/Work-Flow-of-JavaScript/i-WCd2pM3/0/O/AWS%20-%20Elastic%20Beanstalk%2003%20-%20Broken%20EBS%20-%20Delete%20it.png" alt="Deleting the Application With the Odd Naming" width="960" height="728" />

So this time going back she created the application space specifically and went through the various steps to create the application.

<img src="http://photos.adron.me/Software/Software-Development/Work-Flow-of-JavaScript/i-CTs7bgB/0/O/AWS%20-%20Elastic%20Beanstalk%2007.png" alt="Creating a new environment." width="960" height="728" />

<img src="http://photos.adron.me/Software/Software-Development/Work-Flow-of-JavaScript/i-9wXhM25/0/O/AWS%20-%20Elastic%20Beanstalk%2008.png" alt="Creating a load balanced, auto-scaled elastic beanstalk application" width="960" height="728" />

<img src="http://photos.adron.me/Software/Software-Development/Work-Flow-of-JavaScript/i-TvCRtjZ/0/O/AWS%20-%20Elastic%20Beanstalk%2009.png" alt="Basic Settings" width="960" height="728" />

<img src="http://photos.adron.me/Software/Software-Development/Work-Flow-of-JavaScript/i-KcZr38c/0/O/AWS%20-%20Elastic%20Beanstalk%2010.png" alt="More Settings." width="960" height="728" />

Keep clicking next and then...

<img src="http://photos.adron.me/Software/Software-Development/Work-Flow-of-JavaScript/i-HxSMThZ/0/O/AWS%20-%20Elastic%20Beanstalk%2012.png" alt="Then let the beanstalk start." width="960" height="728" />

Now that this is started Keartida logged into CodeShip to setup the final deployment steps for good builds to deploy directly to this beanstalk application.

<img src="http://photos.adron.me/Software/Software-Development/Work-Flow-of-JavaScript/i-Lq2BbxR/0/L/AWS%20-%20Elastic%20Beanstalk%2013-L.png" alt="CodeShip Builds and Where to find Deployments" width="800" height="521" />

Once Keartida clicked on Deployment she had options to pick what to deploy to. One of the options is of course Elastic Beanstalk.

<img src="http://photos.adron.me/Software/Software-Development/Work-Flow-of-JavaScript/i-rjjqjcM/0/L/AWS%20-%20Elastic%20Beanstalk%2014-L.png" alt="Selecting a Branch and What to Deploy To" width="800" height="521" />

<img src="http://photos.adron.me/Software/Software-Development/Work-Flow-of-JavaScript/i-hGMDZQN/0/O/AWS%20-%20Elastic%20Beanstalk%2015.png" alt="Selecting Elastic Beanstalk to deploy to" width="1118" height="728" />

The next screen provides options to select branches of the build to deploy with and related information.

<img src="http://photos.adron.me/Software/Software-Development/Work-Flow-of-JavaScript/i-fSNmnkL/0/L/AWS%20-%20Elastic%20Beanstalk%2017-L.png" alt="Set the Elastic Beanstalk Parameters" width="800" height="521" />

Keartida set the key ID and access key. After that she selected the US West 2 data center, the environment and application names, and the S3 bucket. She retrieved the S3 bucket name by navigating into the S3 service and finding the name on the management console as shown.

<img src="http://photos.adron.me/Software/Software-Development/Work-Flow-of-JavaScript/i-K55rPgD/0/L/AWS%20-%20Elastic%20Beanstalk%2016-L.png" alt="S3 Buckets" width="800" height="521" />

Once all the parameters were entered Keartida then clicked on create and CodeShip then shows the settings saved as shown below.

<img src="http://photos.adron.me/Software/Software-Development/Work-Flow-of-JavaScript/i-XPTC4pr/0/L/AWS%20-%20Elastic%20Beanstalk%2019-L.png" alt="Saved Settings" width="800" height="521" />

After that Keartida created the production branch and pushed it to github. There the build started as shown and began the deploy to AWS Elastic Beanstalk.

<img src="http://photos.adron.me/Software/Software-Development/Work-Flow-of-JavaScript/i-MC5kCgs/0/L/AWS%20-%20Elastic%20Beanstalk%2020-L.png" alt="Beanstalk Deploy starts after the build" width="800" height="489" />

Finally once the deployment is detected to have successfully been pushed out and launched in AWS Elastic Beanstalk a message will appear and the build will go green.

<img class="" src="http://photos.adron.me/Software/Software-Development/Work-Flow-of-JavaScript/i-Jsm98gw/0/L/AWS%20-%20Elastic%20Beanstalk%2021-L.png" alt="Deployment Successful!" width="800" height="489" />

Now, after Keartida completed this it's time to really dive into the workflow of development. Next up, we'll get a basic site and API services up and running.
