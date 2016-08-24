---
title: Wintersmith Creating Documentation
author: Adron Hall
date: 2014-02-17
template: article.jade
---
I set out a few days ago to put together a documentation site. I had a few criteria for this site:

1. A static site that I could push to Github to use with their github pages feature.

2. The static site is generated from markdown.

3. It just works. It's easy to get it into a workflow without breaking the tool or breaking a solid workflow.

That was it, what I'd consider some pretty straight forward criteria. However it wasn't that easy, until it was. Here's a few of the issues I ran through on the way to getting a solid tool with a solid workflow working together. Beware however if you have fickle reading eyes, the following is a rant about what does and does not work.

<span class="more"></span>

<h2>[rant on]</h2>
<strong>Middleman Broken Ruby and Broken Gems</strong>

I have a Mac Book Pro Retina 15". The machine runs OS-X Mavericks. I've had zero issue with this OS. It comes with Ruby 2 and some version of gems. My first attempt was to take a stab with <a href="http://middlemanapp.com/" target="_blank">middleman</a>, the same static site builder used by many companies including Basho. Even though I ran into problems which I detailed in "<a href="http://compositecode.com/2012/12/09/basho-first-week-coding-research-adventures/" target="_blank">Basho – First Week Coding &amp; Research Adventures…</a>" and "<a href="http://compositecode.com/2012/12/14/un-breaking-mountain-lion-os-x/" target="_blank">Un-breaking OS-X Mountain Lion</a>" eventually middleman <em>mostly</em> worked.

Well, I didn't get to a working app very fast. Immediately Ruby 2 had issues and gemsets puked middleman everywhere. I then ran into some confusing permissions errors. About 15 minutes into this process of troubleshooting middleman I had flashbacks of the first few days at Basho and thought, "<em>this is bullshit, something has to work better than this catastrofuck of software version conflicts</em>". So I dropped middleman dead.

<strong>Assemble, Assemble, Assemble...    ??!?#@$%! WTF!</strong>

I attempted <a href="http://assemble.io/" target="_blank">assemble</a> next for the node.js stack. It <em>looked</em> to have a lot of promise. It uses grunt.js and a bunch of other tools to manage a static site generating, bootstrap using stack. The more I looked at it however it seemed busy. Busy as in "<em>I'm going to do more than three things so I'll maybe do none of them right</em>".

Reading about assemble I turned to another hacker slinging some code at the bar I sat at. She looked at the project and asked, "<em>what's it supposed to do exactly? I get that it's a framework of tools but it doesn't' exactly lay out what it is supposed to be doing besides arbitrarily managing some parts of the stack.</em>" That seemed reasonable to me.

Before I just tossed assemble.io to the trash heap of options I wanted to ask at least one more person. So the next day I asked my good friend and super genius Troy Howard. It was a short verdict, "drop that shit".

That was enough for me, assemble was officially dead for this project.

<strong>Slate, This Seems Slick But...</strong>

I then took a stab at <a href="http://tripit.github.io/slate/" target="_blank">Slate</a>. <a href="http://tripit.github.io/slate/" target="_blank">Orchestrate.io just created some excellent documentation</a> using the Slate solution. So I dove into this, getting a test site up and running rapidly. It seemed like a mostly viable solution until I started running into issues with how and where I wanted things displayed for the code samples and other material. It appeared, if I were going to use Slate, I'd be using it almost exactly as is. I might borrow pieces of it in the future, even the layout to some degree, but for now I wanted something else that I could incorporate my themes as needed. Alas, I was super happy with Slate, it just wasn't a great fit for now.

<strong>Where The Hell Are My Options, Jekyll?</strong>

At this point I was getting a little frustrated. I then went to a tried and true solution in <a href="http://jekyllrb.com/" target="_blank">jekyll</a>. Jekyll is a pretty solid solution, with some bugs and oddball issues but nothing major. I started working with it and even transitioning a jekyll project into my theme. Hacking a jekyll blog into a reasonable documentation solution this seemed like the way to go.

But then I got a wild urge to see if there was anything else in Node.js land that I was missing. I really didn't want to sling a Ruby project if I didn't have to. I'd rather keep all the stacks around JavaScript for this particular set of projects. No reason to diverge when I'm just dealing with such simple straight forward web projects. I'll diverge when something truly validate diverging, like doing some real math with a real functional language or something. Trading Node.js for one single project to go with a pseudo Ruby project for static site generation just didn't seem appealing. So I started looking around one more time.

<strong>Made in -34°C</strong>

<div class="image float-right">
    ![-34° Celsius](temp.png)
    Yup, -34 Celsius. That's about as cold as it gets. Click for the full size chart!
</div>

The next solution I tried was <a href="http://wintersmith.io/" target="_blank">Wintersmith</a>. This solution appeared to have everything that I'd been looking for feature wise. It was a node.js project, it generated static content, could generate blogs but other things too, was simple, had plugins, was straight forward and more. I was a little paranoid after the solutions I'd fought my way through earlier so I went to the only place that would insure that I'd have a solution I could be confident in. I went straight to the <a href="https://github.com/jnordberg/wintersmith" target="_blank">source</a>!

I'll admit I took a peak at the package.json file before going head long into the source. A quick perusal of the dependencies list looked ok.

      dependencies: {
        marked: ~0.3.0,
        coffee-script: ~1.6.3,
        async: ~0.2.9,
        highlight.js: ~8.0.0,
        jade: ~1.1.5,
        ncp: ~0.5.0,
        rimraf: ~2.2.6,
        winston: ~0.7.2,
        colors: ~0.6.2,
        optimist: ~0.6.0,
        minimatch: ~0.2.14,
        mime: ~1.2.11,
        js-yaml: ~3.0.1,
        mkdirp: ~0.3.5,
        chokidar: ~0.8.1,
        server-destroy: ~1.0.0,
        npm: ~1.3.24,
        slugg: ~0.1.2
      },
      devDependencies: {
        shelljs: 0.1.x
      }

I immediately took note of a few things. The first was that there was actually a breakout of dev dependencies versus actual project dependencies. That's a good first sign. The second thing I just went through the list and checked the various library dependencies, there were a few that I've played around with before that I trusted; highlight.js, coffee-script, async, js-yaml and npm were all cool by me. It didn't seem to crazy out of whack. With that I went forth into the code with zero expectations...

The first files I dug into were the <a href="https://github.com/jnordberg/wintersmith/blob/master/src/core/config.coffee" target="_blank">config.coffee file</a>, which pointed out a few things I'd want to possibly tweak a little later such as the port number and other things the wintersmith server would use when running the preview server.

    class Config
      ### The configuration object ###

      @defaults =
        # path to the directory containing content's to be scanned
        contents: './contents'
        # list of glob patterns to ignore
        ignore: []
        # context variables, passed to views/templates
        locals: {}
        # list of modules/files to load as plugins
        plugins: []
        # modules/files loaded and added to locals, name: module
        require: {}
        # path to the directory containing the templates
        templates: './templates'
        # directory to load custom views from
        views: null
        # built product goes here
        output: './build'
        # base url that site lives on, e.g. '/blog/'
        baseUrl: '/'
        # preview server settings
        hostname: null # INADDR_ANY
        port: 8080
        # options prefixed with _ are undocumented and should generally not be modified
        _fileLimit: 40 # max files to keep open at once
        _restartOnConfChange: true # restart preview server on config change


Second code file that looked interesting, the <a href="https://github.com/jnordberg/wintersmith/blob/master/src/core/renderer.coffee" target="_blank">renderer.coffee</a> code file.

    fs = require 'fs'
    util = require 'util'
    async = require 'async'
    path = require 'path'
    mkdirp = require 'mkdirp'
    {Stream} = require 'stream'

    {ContentTree} = require './content'
    {pump, extend} = require './utils'

    if not setImmediate?
      setImmediate = process.nextTick

    renderView = (env, content, locals, contents, templates, callback) -&gt;
      setImmediate -&gt;
        # add env and contents to view locals
        _locals = {env, contents}
        extend _locals, locals

        # lookup view function if needed
        view = content.view
        if typeof view is 'string'
          name = view
          view = env.views[view]
          if not view?
            callback new Error &quot;content '#{ content.filename }' specifies unknown view '#{ name }'&quot;
            return

        # run view
        view.call content, env, _locals, contents, templates, (error, result) -&gt;
          error.message = &quot;#{ content.filename }: #{ error.message }&quot; if error?
          callback error, result

    render = (env, outputDir, contents, templates, locals, callback) -&gt;
      ### Render *contents* and *templates* using environment *env* to *outputDir*.
          The output directory will be created if it does not exist. ###

      env.logger.info &quot;rendering tree:\n#{ ContentTree.inspect(contents, 1) }\n&quot;
      env.logger.verbose &quot;render output directory: #{ outputDir }&quot;

      renderPlugin = (content, callback) -&gt;
        ### render *content* plugin, calls *callback* with true if a file is written; otherwise false. ###
        renderView env, content, locals, contents, templates, (error, result) -&gt;
          if error
            callback error
          else if result instanceof Stream or result instanceof Buffer
            destination = path.join outputDir, content.filename
            env.logger.verbose &quot;writing content #{ content.url } to #{ destination }&quot;
            mkdirp.sync path.dirname destination
            writeStream = fs.createWriteStream destination
            if result instanceof Stream
              pump result, writeStream, callback
            else
              writeStream.end result, callback
          else
            env.logger.verbose &quot;skipping #{ content.url }&quot;
            callback()

      items = ContentTree.flatten contents
      async.forEachLimit items, env.config._fileLimit, renderPlugin, callback

    module.exports = {render, renderView}

Fairly straight forward code. Puts together the rendered content and I noted a few key things. There was a solid process order that was repeated; env, content, locals, contents, templates, callback. Because of this it looked like local variables were set to statically set certain things based on configuration instead of dynamic location. This could bite me, but with this quick glance, at least I knew where and what was happening with the order of generation.

I then did a scan of the <a href="https://github.com/jnordberg/wintersmith/blob/master/src/core/templates.coffee" target="_blank">templates.coffee</a> and a few other code files. Having gotten a fair idea of where and what was being done, I went looking for a quick start. Things looked pretty good, so I crossed my fingers and my rant ends here...
<h2>[/rant off]</h2>
So now that the rant mode was over, here's what I did to make wintersmith my documentation solution. Most of this is in a state of flux as I automate and put more into the project to simplify the workflow.

Here's how I got started super fast.

<div class="image float-right">
    [![Wintersmith Icon 4](wintersmith-04.png)](http://wintersmith.io/)
</div>

First step is get <a href="http://wintersmith.io/" target="_blank">Wintersmith</a> running.

    npm install wintersmith -g

Note that you'll need to install it globally (thus the -g) and may need to install Wintersmith with sudo prepended to that command.

The next thing that I did was create a directory that I'd use to build the static generated contents. This material I'd put into a git repository on github (namely the <a href="https://github.com/Deconstructed/deconstructed/tree/gh-pages" target="_blank">deconstructed gh-pages repo</a>). I'll call this generically the root directory.

    mkdir rootDirectory

After that I navigated into the rootDirectory and created a new Wintersmith Application.

    wintersmith new myAppName

That now gives me a directory structure like this

* rootDirectory
* myAppName

Now that I have this, the app content, markdown, views and related templates are in myAppName. To view the app, I changed directories into myAppName and ran wintersmith preview like this

    wintersmith preview

Opening up a browser I can navigate to <a href="http://localhost:8080" target="_blank">http://localhost:8080</a> and see the fully rendered site. To publish the site however one needs to run wintersmith build, however there's one problem. I want the site to publish to the rootDirectory where the application content currently sites. To do this I have to edit the <em>config.json</em> file. Just above the locals code settings shown below...

    {
      locals: {
        url: http://localhost:8080,
        name: The Wintersmith's blog,
        owner: Someone,
        description: Ramblings of an immor(t)al demigod
    }
    [/sourcecode]

    I added an output key value property to the file as shown. It merely takes the results and shifts them back a directory so they end up in the rootDirectory.

    [sourcecode language="javascript"]
    {
      output:../,
      locals: {
        url: http://docs.deconstructed.io,
        name: Deconstructed Docs,
        owner: Adron Hall,
        description: This site provides the documentation around the Deconstructed API Services.
      },
      plugins: [
        ./plugins/paginator.coffee
      ],
      require: {
        moment: moment,
        _: underscore,
        typogr: typogr
      },
      jade: {
        pretty: true
      },
      markdown: {
        smartLists: true,
        smartypants: true
      },
      paginator: {
        perPage: 6
      }
    }

I also changed the perPage setting to 6, just so I could get a little more content on the main page eventually. There is also the change for the domain name and a few other parameters that I'll catch up on with the next blog entry.

## Summary

In my next blog entry I'll cover a quick how-to on how to setup the CNAME in github pages to get the static wintersmith site up at a subdomain/domain name. I'll also dive into setup with AWS Route 53, which generically applies to setting a gh-pages site up with any DNS provider. So subscribe and I'll have that post in the next 1-2 days.