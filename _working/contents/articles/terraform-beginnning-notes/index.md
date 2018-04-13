---
title: Gaining a Systemic View of Immutable Infrastructure Tooling
author: Adron Hall
date: 2018-03-29 14:20:15
template: article.jade
---
I put together a few starter notes on things you should delve into and understand before working with infrastructure related tooling, like Ansible, Terraform, or similar tools. If you think I've missed any do ping me [@Adron](https://twitter.com/Adron) and let me know your thoughts on other additions. The first starter items I'd list as the following. 

* Computer Networking - Basic understanding of what an IP number is, how they're assigned via DHCP vs. static, and related basic TCP/IP knowledge. Also it is helpful, yet not necessary to understand the idea behind CIDR ranges and related network concepts about addressing also.
* Basic Linux or Unix CLI Commands - Commands like; `ls`, `mv`, `rm`, `cp`, `mkdir`, `rmdir`, `wget`, `curl`, `ping`, `traceroute`, `ifconfig`, `nslookup`, `vi`, `kill`, `chown`, `whoami`, `su`, `chmod`, `chown`, `chroot`, `cat`, `env`, `echo` or `tail`. All these commands are't used in the couse, but they're fundamental for building and troubleshooting any infrastructure and related environments and systems in the future.
* Basic Scripting and Language Constructs - Things like if-then-else, while loops, and related programming constructs for use in scripting like Bash or Powershell.

<span class="more"></span>

With those basics covered, here are some of the things that help shape one getting a good understanding of what Terraform, Ansible, Chef, Puppet, and related tooling is.

* Ansible - https://www.ansible.com/ - Ansible is a tool that helps provision, deploy, and apply compliance of infrastructure through configuration management. It was purchased by Red Hat and is now in their stable of tools.
* Puppet - https://puppet.com - Puppet provides discovery, management of infrastructure, and mutable updates and changes to that infrastructure. It's also important to note that Puppet is made up from a number of individual tools.
* Chef - https://www.chef.io - Chef is one of the leading companies that helped to start and push the DevOps narrative in the industry. It is a tool that provides a programmatic DSL, configuration, and related ways to create and manage one's infrastructure. Chef, similarly to Puppet, is also made up of a number of individual tools, and the company itself continues to develop a number of tools within the space.
* CloudFormation - https://aws.amazon.com/cloudformation/ - AWS CloudFormation provides a way to desribe and provision infrastructure resources in AWS. This is used as the single source of truth for all the cloud resources when used.

I talk about and use Terraform a **LOT** so let's talk comparisons with these tools and Terraform for a moment. Terraform compares with configuration management tools like Chef and Puppet in it's abstract use of provisioners to setup resources such as the network, instances, and other things within the cloud platform being deployed to. Since Terraform operates at this higher level abstraction of the platforms resources are deployed to. By doing this Terraform can be used with, or even similarly to Chef and Puppet. Complementing each other or working independetly.

In comparison to CloudFormation the differences start out with the cross platform and multi-cloud platform capabilities of Terraform versus CloudFormation being limited to only AWS. Terraform also draws out a more stage based approach for each execution. This gives more control about where, when, and why Terraform can replace or be used in conjunction with CloudFormation or any of the tooling mentioned.

## These Tools, Immutable Infrastructure?

With these tools, one key ideal among them is the pattern of immutable infrastrucutre. Defining immutable infrastructure in short is the idea you create and operate your infrastructure using the programming concept of immutability. Once you instantiate something it is never changed. It is replaced with another instance of make changes or ensure proper behavior.

The affect and effect of immutable infrastructure provides stability, efficiency, and fidelity to your applications through automation and the use of successful patterns from software development.

* **Increasing operational complexity can be dealt with.** With the complexity of distributed systems like Cassandra, Kubernetes, and others immutable infrastructure practices have become the defacto way to manage this extra complexity and volume of resources.
* **Snowflake components are removed.** Mutable maintenance methods enable this idea of snowflake components like bespoke, hand crafted, and artisinal  servers and infrastructure. Immutable infrastructure eliminates the possibility of these outliers and increases repeatability within systems and infrastructure.
* **Increased threat identification & mitigration of harm.** With immutable infrastructure the number of knowns, at start and and completion of infrastructure usage increases as needed. Need debugging information, a single way to gather that can be provided, set by policy, and enforced with immutable infrastructure in a way that simply can't be with artisinal infrastructure.
* **Integration and seemless continuous integration and deployment.** With immutable infrastructure the enforcement of and enablement of integration and deployment of solutions is largely self-fulfilled. To deploy through automation requires integration and deployment, for immutable infrastructure automation for integration and deployment is needed, and in turn enables the other.
* **Reproducability is inherent in the system.** The ability to take an environment and all of it's nuances, recreate that enivronment among complex orchestration is flawless with immutable infrastructure. This gives us the ability to set audit points, track, and log data accordingly to the entire environment.

That's my wrap up for getting into and gaining a more holistic idea of what immutable infrastructure is and what tools work to help attain this level of infrastructure development and usage. Until next time, feel free to throw ideas at me via [@Adron](https://twitter.com/Adron)!