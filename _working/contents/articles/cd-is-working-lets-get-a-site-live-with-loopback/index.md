---
title: __4 "CD Is Working, Let's Get a Site Live with Loopback!"
author: Adron Hall
date: 2015-09-07 00:42:17
template: article.jade
---
Since it has been more than a few weeks let's do a quick recap of the previous posts in this series.

1. [Introducing the Thrashing Code Team and Projects](http://compositecode.wordpress.com/2015/04/06/introducing-the-team/) - Know who's working on what and what the projects are.

2. [Getting Started, Kanban & First Steps for a Sharing App](http://compositecode.wordpress.com/2015/04/07/__1-getting-started-kanban-first-steps-for-a-sharing-app/) - Getting the kanban put together and the team involved.

3. [Starting a Basic Loopback API & Continuous Integration](http://compositecode.wordpress.com/2015/04/08/__2-got-our-kanban-lets-start-a-basic-loopback-api/) - Getting the skeleton of the API application setup and the continuous integration services running.</li>

4. [Going the Full Mile, Continuous Delivery](http://compositecode.wordpress.com/2015/06/05/__3-going-the-full-mile-continuous-delivery/) - Here the team got the full continuous delivery process setup for ongoing development efforts.

In this article of the series I work with some of my cohort to get initial parts of the application deployed to production. For the first part of this, let's get some of the work that [Norda](https://github.com/NordaLlah) has done into the project and get it running on the client side.

<span class="more"></span>

<h2>Client Side</h2>

![client directory of the loopback project.](http://photos.adron.me/Software/Software-Development/Work-Flow-of-JavaScript/i-TQ6gRPT/0/O/2015-08-22_15-24-48.png)

The first thing I needed was to get a static page setup. This page would then be used to submit an email to the server side that would then deal with whatever processing that I would have for the email message confirmation and related actions.

In Loopback, it is very easy to setup a static page. I just needed a simple index.html page so I created an empty one in the client directory of the project.

The first thing I did was literally put an index.html file with the words "this should work" in the client directory of the project. But after some tweaking and adding in Norda's work the team ended up with the following.

The next thing to do is setup the Loopback.io framework to host a static site page.

<h3>Static Page via Loopback.io</h3>

This part of the article is taken pretty much straight out of the

[static page hosting Strongloop Loopback.io Documentation](https://docs.strongloop.com/display/public/LB/Add+a+static+web+page).

<blockquote>Applications typically need to serve static content such as HTML and CSS files, client JavaScript files, images, and so on.  It's very easy to do this with the default scaffolded LoopBack application.  You're going to configure the application to serve any files in the <code>/client</code> directory as static assets.

First, you have to disable the default route handler for the root URL.   Remember back in <a class="unresolved" href="https://docs.strongloop.com/display/public/LB/Add+a+static+web+page#">Create a simple API</a> (you have been following along, haven't you?) when you loaded the application root URL, <a class="external-link" href="http://localhost:3000/" rel="nofollow">http://localhost:3000/</a>, you saw the application respond with a simple status message such as this:
<pre>{"started":"2014-11-20T21:59:47.155Z","uptime":42.054}</pre>
This happens because by default the scaffolded application has a boot script named <code>root.js</code> that sets up route-handling middleware for the root route ("/"):

<b>server/boot/root.js</b>

```javascript
module.exports = function(server) {  // Install a `/` route that returns server status
  var router = server.loopback.Router();
  router.get('/', server.loopback.status());
  server.use(router);
};
```

This code says that for any GET request to the root URI ("/"), the application will return the results of <code><a class="external-link" href="http://apidocs.strongloop.com/loopback/#loopbackstatus" rel="nofollow">loopback.status()</a></code>.

To make your application serve static content you need to disable this script.  <strong>Either delete it or just rename it</strong> to something without a <code>.js</code> ending (that ensures the application won't execute it).
<h2>Define static middleware</h2>
Next, you need to define static middleware to serve files in the <code>/client</code> directory.

Edit <code>server/middleware.json</code>.  Look for the "files" entry:

``` javascript
...
  "files": {
  },
...
```

<b>server/middleware.json</b>

Add the following:

``` javascript
...
  "files": {
    "loopback#static": {
      "params": "$!../client"
    }
  },
...
```

These lines define <em><a href="https://docs.strongloop.com/display/LB/Defining+middleware#Definingmiddleware-Staticmiddleware">static middleware</a></em> that makes the application serve files in the <code>/client</code> directory as static content.  The <code>$!</code> characters indicate that the path is relative to the location of <code>middleware.json</code>.
<h2 id="Addastaticwebpage-AddanHTMLfile">Add an HTML file</h2>
Now, the application will serve any files you put in the <code>/client</code> directory as static (client-side) content.  So, to see it in action, add an HTML file to <code>/client</code>.  For example, add a file named <code>index.html</code> with this content:

<b>/client/index.html</b>

```javascript
<head>
    <title>LoopBack</title>
</head>
<body>
<h1>Whatevs</h1>
Some static content...  but just look at the big HTML file below!  :)

</body>
```

Of course, you can add any static HTML you like–this is just an example.</blockquote>

<div class="image float-right">
[![The Logo](http://photos.adron.me/Software/Software-Development/Work-Flow-of-JavaScript/i-57TRrsf/0/S/ms-icon-310x310-S.png)](https://github.com/ThrashingCode/coder-swap)
</div>

### Graphic Assets

Norda setup the project with a number of assets for the current page creation as well as future pages the site will need. The theme is a high quality theme, with the Coder Swap Logo added at respective key locations. The following are the graphics assets included in the project under the [client directory here](https://github.com/Adron/coder-swap/tree/registration-page/client).

The key files that are included that will be used for our first site we deploy are the various favicon, logo, and related images. You can see those in the root of the client directory. There are a whole bunch of them because of the funky mobile design requirements.

### Index.html

The first page I've setup is a simple sign up page, with no real functionality. Just something to get started with to build off of. The code for that page looks like this.

``` javascript
<!DOCTYPE html>
<html>
<head>
    <title>
        Code Swap - Notify Me!
    </title>
    	<link href="http://fonts.googleapis.com/css?family=Lato:100,300,400,700" media="all" rel="stylesheet"
          type="text/css"/>
    	<link href="stylesheets/bootstrap.min.css" media="all" rel="stylesheet" type="text/css"/>
    	<link href="stylesheets/font-awesome.min.css" media="all" rel="stylesheet" type="text/css"/>
    	<link href="stylesheets/se7en-font.css" media="all" rel="stylesheet" type="text/css"/>
    	<link href="stylesheets/style.css" media="all" rel="stylesheet" type="text/css"/>
    	<link rel="shortcut icon" href="favicon.ico">
    	<link rel="apple-touch-icon" sizes="57x57" href="apple-icon-57x57.png">
    	<link rel="apple-icon" sizes="114x114" href="apple-icon-114x114.png">
    	<link rel="apple-icon" sizes="72x72" href="apple-icon-72x72.png">
    	<link rel="apple-icon" sizes="144x144" href="apple-icon-144x144.png">
    	<link rel="apple-icon" sizes="60x60" href="apple-icon-60x60.png">
    	<link rel="apple-icon" sizes="120x120" href="apple-icon-120x120.png">
    	<link rel="apple-icon" sizes="76x76" href="apple-icon-76x76.png">
    	<link rel="apple-icon" sizes="152x152" href="apple-icon-152x152.png">
    	<link rel="apple-icon" sizes="180x180" href="apple-touch-icon-180x180.png">
    	<link rel="icon" type="image/png" href="favicon-192x192.png" sizes="192x192">
    	<link rel="icon" type="image/png" href="favicon-160x160.png" sizes="160x160">
    	<link rel="icon" type="image/png" href="favicon-96x96.png" sizes="96x96">
    	<link rel="icon" type="image/png" href="favicon-16x16.png" sizes="16x16">
    	<link rel="icon" type="image/png" href="favicon-32x32.png" sizes="32x32">
    <meta name="msapplication-TileColor" content="#ffffff">
    <meta name="msapplication-TileImage" content="mstile-144x144.png">
    <meta name="msapplication-config" content="browserconfig.xml">

    <script src="http://code.jquery.com/jquery-1.10.2.min.js" type="text/javascript"></script>
    <script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js" type="text/javascript"></script>
    <script src="javascripts/bootstrap.min.js" type="text/javascript"></script>
    <script src="javascripts/modernizr.custom.js" type="text/javascript"></script>
    <script src="javascripts/main.js" type="text/javascript"></script>
    <meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" name="viewport">
</head>
<body class="login2">
<!-- Registration Screen -->
<div class="login-wrapper">
    <a href="./">
        <img width="100"
             height="30"
             src="images/logo-login@2x.png"/>
    </a>
    <form>
<div class="form-group">
<div class="input-group">
                <span class="input-group-addon">
                    <i class="fa fa-envelope"></i>
                </span>
                <input class="form-control"
                       type="text"
                       value="Enter your email address"></div>
</div>
<input class="btn btn-lg btn-primary btn-block"
               type="submit"
               value="Register for updates!">
    </form></div>
<!-- End Registration Screen -->
</body>
</html>
```

As you can see a bulk of the page is favicon and logo related nonsense while about a 1/3rd of the screen is actually the HTML for the form itself. What that looks like when rendered is something like this.

<img src="http://photos.adron.me/Software/Software-Development/Work-Flow-of-JavaScript/i-nbjH27Z/0/O/2015-09-07_08-07-29%20-%202.png" alt="The registration page." width="851" height="545" />

Once that page is up we can then commit to the production branch as outlined in the <a href="http://compositecode.com/2015/06/05/__3-going-the-full-mile-continuous-delivery/" target="_blank" rel="noopener">previous blog entry</a>.

<em>btw</em> - If you're curious (especially if you've read the intro blog entry about the <a href="http://compositecode.com/2015/04/06/introducing-the-team/" target="_blank" rel="noopener">mock team</a>), you might be wondering where and who and how did I create this gorgeous theme? Well, I didn't, I actually purchased this sweet theme from <a href="http://themeforest.net/" target="_blank" rel="noopener">Theme Forrest</a>. The specific theme is <a href="http://themeforest.net/item/se7en-bootstrap-3-responsive-admin-template/5423243" target="_blank" rel="noopener">se7en</a>.
