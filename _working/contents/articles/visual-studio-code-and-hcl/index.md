---
title: Visual Studio Code (an intro with snark!) and Hashicorp Configuration Language
author: Adron Hall
date: 2016-08-22 18:21
template: article.jade
---
I sat down to setup Visual Studio Code for some Go coding. That is, #golang or "golang" on Google, because heaven forbid a language is named something that isn't ubiquitous like the word "go". But anyway, I digress, because this blog entry isn't even about golang. It's about HCL. You see, I sat down to toy about with golang but then I had to knock out a few tasks with Terraform, Packer, and such. To do that I needed the HCL support that Visual Studio Code has. I knew there was a plugin for Hashicorp Configuration Language (i.e. HCL). So I decided to do that work in Visual Studio Code and try out the HCL Plugin. Maybe next blog entry I'll get around to writing some golang in Visual Studio Code?

![The Site](code-go-00.png)

<span class="more"></span>

The first thing I needed to do though, was download and get Visual Studio Code. I'd neglected to learn much about it or use Code (I'll just call it that from now on, Visual Studio Code is way to much to write, plus it's not really got much in familial relation to Visual Studio). That download, it all started [here](https://code.visualstudio.com). I opened it upon finishing installation to a brand new Visual Studio Code Window.

![Visual Studio Code](code-go-01.png)

I toyed about a moment looking at the Visual Studio Code website, then toyed around with the editor, and noticed three things immediately.

1. When I navigated to `https://code.visualstudio.com` I noticed I was redirected or someway navigated to a link that immediately shoved some type of session mess into the URI. My link of `https://code.visualstudio.com` turned into `https://code.visualstudio.com/b?utm_expid=101350005-27.GqBWbOBuSRqlazQC_nNSRg.1`. Now I'm not sure about you but that type of behavior on a website actually pisses me off and makes me paranoid. I went through various things to determine what was going on, but suffice it to say I determined it was just an annoying contrivance that the site managers make the site do. Whatever...

2. The second thing I noticed was that I had no idea what to do to install plugins. Was it the same as Atom as I'd heard? Was it some other command? I assumed since I'd used Code a few times before, it was likely the command line I tried a few based on other tooling. First `⌘ + space`, nope, that was dumb. I have that mapped to [Spotlight](https://en.wikipedia.org/wiki/Spotlight_(software)). Ok, so then I tried `⌥ + space`, nope. `⌘ + ⌥ + ^ + F12`, naw. Ok, dammit, I guess it's `⌘` key plus something I'll bet. Then I tried a whole slew and sure enough, **`⌘ + p`** was the magic sauce. But wait, it wasn't. At this point I thought "maybe I should look this up" but I decide to stay stubborn and try some other things I *think* I remember about Code. I try the `fn + F1`, or what might be just `F1` if you have your keyboard setup for function keys instead of the other OS-X uses. Sure enough, that was the command dialog I wanted.  

3. I opened up another Code window so that I could also use the editor to write this very blog entry. I use [Wintersmith](http://wintersmith.io/) and have even written about it in the past [Wintersmith Creating Documentation](/articles/wintersmith-creating-documentation) and [Working in -34c Wintersmith Customization and Github Hosting](/articles/working-in-34c-wintersmith-customization-and-github-hosting). It's a great Node.js static site generator. I immediately noticed as I started typing that Visual Stuido Code supports basic markdown on the basic installation! Holy shit, that's super rad!

Ok, on with the meat of all this.

With the opened Code Window, I hit `fn + F1` (again, that's just `f1` if you've got your function keys turned on for OS-X) and typed in `ext`. That gave me the following dialog.

![Visual Studio Code](code-go-02.png)

The list that displays, I then hit the down arrow key and selected *Extensions: Install Extensions*. With that selected I hit enter and down the left hand side of Code I got the extensions list. The focus changes to that, so no need for the mouse still.

![Visual Studio Code](code-go-03.png)

I pressed the down arrow to select the HCL extension, but realized that was taking a minute, so shifted focus to the search box and just typed HCL. That immediately brought up the display of the extension once I hit the down arrow and then enter.

![Visual Studio Code](code-go-04.png)

Now I wasn't sure how to install this, since I wanted to avoid using the mouse if possible. I just hit enter again and it worked! Since that worked, I hit enter again with the premise that it would now *enable* the extension, which it did indeed do with a simple prompt to restart Code. I clicked on *ok* and on to the restart of Code.

![Visual Studio Code](code-go-05.png)

When Code restarted and came back up, I had one Code Windows with the default empty document, with no directory opened, and I opened up another using *File -> New Window* and then used it to open the directory in which I was editing this blog entry. 

![Visual Studio Code](code-go-06.png)

To get the word wrap back (which I'd manually clicked before) I recalled the shortcut key is `⌥ + Z`. This is super useful when editing markdown like this, so it's a keyboard shortcut to set to memory.