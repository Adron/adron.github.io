---
title: Know Your Toolchain, But...
author: Adron Hall
date: 2017-06-25 11:23:15
template: article.jade
---
*GSD Tips Issue 2*

The way we build applications are done with a mix of tooling; compilers, IDEs, text editors, and others. Knowing these tools well is fundamental to being effective at implementing solutions in a systemic way. Not knowing the tools adds endless interruptions during the process that add up, cause frustration and stress, and generally prevent you from getting shit done. To summarize this tip...

> Specifically learn how to do what your doing with the tool your going to need to work in.

Here are some of the specifics to focus on...

<span class="more"></span>

1. *IDEs - Whether it's VIM, Emacs, WebStorm, Intellij, Visual Studio, Visual Studio Code, Atom, Eclipse, Notepad, Gedit, or some other editor of some sort get to know it extremely well.* Learn the shortcuts for building and editor layouts or word wrap or whatever functionality is used regularly. Don't resort to banging away at the mouse, it's just one more mental interruption to staying in the problem space you're writing code to solve.
1. *Don't get locked into the peripheral tooling.* This is most noticeably a problem in the realm of Microsoft's Visual Studio or even XCode where the IDE is required for the underlying languages and tooling to even work. At least, in the sense that after a project is started, and the IDE is locked into the project structure it's almost impossible to use, maintain, or develop against the code without the IDE itself. This is a bad idea, even if you're OK with being subservient to the IDE itself. For those in .NET land that have ever had to setup a build server with the Visual Studio IDE installed to actually get a build of the solution, you know all to well how insanely bad this crutch is. Don't fall for it and you'll be happier with your career over time. TLDR; *Use the IDE to build things but don't become subservient to your IDE. If you can't run a build without the IDE, you've seriously built yourself into a problem.*
1. *Use plugins to help, but don't get locked into the plugins.* Same as the IDE. For example, if you setup your HCL (HashiCorp Configuration Language) plugin with IntelliJ and are rocking your templates this way, you can still the next minute turn around and on an entirely new machine with zero plugins edit, maintain, or execute a patch or something against your HCL config. This is the same for most things, and maintains the flexibility of the plugin without limiting your future needs and options to interact with the code/config or whatever.
1. Know a tool chain and related language, IDE, etc very well, but know many in a general sense. In other words, keep a systemic knowledge of what things are for so that you have the ability to use the right tool for the right job. This enables you to switch the tool chain and stack when you need to specific benefits of a system you don't particularly know.

**Summary**

Whatever you're building in, know one toolchain well, but know what others exist too. The idea, is if you move up a level of abstraction away from the tooling into the realm of the problem domain, the tooling may need to change. Be able to know when it should change, to use *the right tool for the job*, and solutions work better, time is better spent, and your ability to come up with a systemic solution instead of a *one off* throwaway solution dramatically increases. I mean, you wouldn't use Terraform to try to build a user interface for Windows, and it would be insane to use .NET to build a configuration for your ecosystem! Use the right tool for the job, and don't get locked into a single tool to try to implement every solution!

Got other suggestions on how to GSD? Lemme know on the twitters [@Adron](https://twitter.com/Adron).

**GSD Tips Issue 0002** of [...many...](/docs/gsd-tips/)