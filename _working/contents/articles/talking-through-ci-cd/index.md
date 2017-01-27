---
title: Talking Through Continuous Integration (CI) and Delivery (CD)
author: Adron Hall
date: 2017-01-26 14:45:46
template: article.jade
---
Ok, we have several different scenarios and you're the boss. Here are the scenarios for the projects you're working on:

## Scenarios

* *Scenario 1:* You have team of 4 people. All developers by trade and experienced. The team may, about 20% chance in the coming 3-6 months, grow to ~8 people, with 1-2 of those being automation experts that could prospectively manage CI/CD systems. Currently the project is just starting, and the decision on what language and tech stack has been determined and initial coding will be starting in the coming week. Currently, there is no CI/CD setup for this project.

* *Scenario 2:* Another team has 33 developers, 4 are site reliability with 2 more working with them frequently on systems automation. No real growth for the team in the next 2-3 years. The application these developers work on has new feature development and maintenance, lot's of ongoing maintenance. Currently there is also a fair amount of technical debt associated with the code base that needs paid off for each new feature implemented, or any significant changes during maintenance of the software. This team currently has no CI or CD of the application setup.

* *Scenario 3:* The third team is 4 people, pairing, and they have the highest output and quality of the rest of the teams. Largely because they work well together but also they have minimal technical debt and can move quickly. The application has been under development for about 3 months and they currently have a CI process setup with Drone.io. No deployment is setup yet nor is any infrastructure or other tooling setup beyond what they've already setup with the Drone.io solution.

* *Scenario 4:* Fourth scenario is a large team of 232 people. There are 9 organizations with multiple people in each of those organizations, split out to developers, project management, product development leads, and a core architecture team. Among the 232 there are also 17 people dedicated to automation and infrastructure management. This team manages one huge monolithic application that currently is built with manual build processes that are partially scripted. Of these build processes there are 11 of them, which then must be combined via some more scripts and more manual processes that are then pushed to a *test development* environment, where a subsequent 4 people work full time testing the *test development* environment.

<span class="more"></span>

Each of these scenarios has a clear and present need for continuous integration and delivery setup. Just for context, when I write continuous integration or continuous delivery I define these like this:

**Continuous Integration** - [Wikipedia](https://en.wikipedia.org/wiki/Continuous_integration) - [Thoughtworks](https://www.thoughtworks.com/continuous-integration)

> ...is the process of bringing together the assets of an application or service project to compile that code into a binary. In the case of JavaScript or other non-compiled language this process would include any transpiling or gathering of assets that are needed in order to execute the code via the integration process. In most cases I include unit testing, and sometimes certain types of or styles of behavior tests in a project to be included under the process of continuous integration.

**Continuous Delivery** -  [Wikipedia](https://en.wikipedia.org/wiki/Continuous_delivery) - [Thoughtworks](https://www.thoughtworks.com/continuous-delivery)

> ...is the process of events that must be completed, in an automated fashion, after the continuous integration process to take code or a binary from the transpiled or binary state into a production environment in which it will be used or executed. This is fairly easy to outline with a services or web application, since there is an obvious way in which this code needs to be called (via http/https in a browser) but some other applications, like a CLI or desktop application are slightly more diverse in the way they may be delivered. These later applications we can safely assume have a continuous delivery process that would vary widely but be something like being packaged into an installer (in the case of OS-X a .pkg file or in the case of Windows into a .exe or .msi file.)

Also an excellent resource is available [here](https://continuousdelivery.com/).

## Solutions Discussion for

* *Scenario 1:*

* *Scenario 2:*

* *Scenario 3:*

* *Scenario 4:*

## Solutions

* *Scenario 1:*

* *Scenario 2:*

* *Scenario 3:*

* *Scenario 4:*
