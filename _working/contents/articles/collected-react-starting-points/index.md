---
title: Collected React Starting Points Links and Notes
author: Adron Hall
date: 2017-05-15 11:05:44
template: article.jade
---
<div class="image float-left">
    ![React](react.png)
</div>

The following is a collection of links and related things that I have used for learning React this last two weeks. I've attempted to sort them into a way that seems useful, at least to me, and hope that this can be useful to others. Where the link was given via Twitter, I've embedded to tweet so it gives reference to those that have helped me along the way. Others are just inline as I found them via google or via whatever method.

<span class="more"></span>

These materials actually step through or explain in detail design and implementation concepts behind React or various parts of React.

From Joachim [@PelotonTechIO](https://twitter.com/pelotontechio) an article written by [Indrek Lasn](https://medium.com/@wesharehoodies) on [Medium](https://medium.com) @ https://medium.com/@wesharehoodies/easy-guide-for-webpack-2-0-from-scratch-fe508a3ce44e

<blockquote style="width: 100%" class="twitter-tweet" data-lang="en"><p lang="en" dir="ltr"><a href="https://twitter.com/Adron">@Adron</a> Is this what you&#39;re looking for? <a href="https://t.co/P2wqSrsjPC">https://t.co/P2wqSrsjPC</a> (and <a href="https://t.co/c0foor14Z7">https://t.co/c0foor14Z7</a>)</p>&mdash; Christopher Biscardi (@chrisbiscardi) <a href="https://twitter.com/chrisbiscardi/status/863137627368677376">May 12, 2017</a></blockquote>

This tweet and links by Christopher Biscardi were super helpful. There is the [Codebase Overview](https://facebook.github.io/react/contributing/codebase-overview.html) and [Implementation Notes](https://facebook.github.io/react/contributing/implementation-notes.html) links. Both, super helpful and information that I wasn't finding easy to get at.

<blockquote class="twitter-tweet" data-lang="en"><p lang="en" dir="ltr"><a href="https://twitter.com/Adron">@Adron</a> For Babel there&#39;s <a href="https://t.co/xxXttxl2Do">https://t.co/xxXttxl2Do</a> for Webpack: <a href="https://t.co/mlU6ZhnExC">https://t.co/mlU6ZhnExC</a></p>&mdash; Christopher Biscardi (@chrisbiscardi) <a href="https://twitter.com/chrisbiscardi/status/863164375758131200">May 12, 2017</a></blockquote>
<script async src="//platform.twitter.com/widgets.js" charset="utf-8"></script>

Babel Handbook > https://github.com/thejameskyle/babel-handbook/blob/master/translations/en/README.md

This is actually broken down into the *Babel Handbook* and then the *Plugin Handbook*.

Here are some links I've found that I'm currently working through as examples. They're fairly useful in the context of getting some hands on experience just putting something together that is simple, works, and can be built off of.

* [CURD Application with React Sprintboot & User Auth](https://stormpath.com/blog/crud-application-react-spring-boot-user-authentication) by Karl Penzhorn [@gostormpath](https://twitter.com/gostormpath) with a [repo on Github](https://github.com/stormpath/stormpath-spring-boot-react-example)... two other good entries I've reviewed are [Build a React App With User Auth](https://stormpath.com/blog/build-a-react-app-with-user-authentication) and [Optimize React with WebPack](https://stormpath.com/blog/optimize-react-webpack).
* [Building a CRUD App Using React, Redux, and FeatherJS](https://www.sitepoint.com/crud-app-react-redux-feathersjs/) my Michael Wanyoike ([@myxsys](https://twitter.com/myxsys)).

The hello world on the React site. It's ok, but I found it lacking so I had to search onwards for more specific information.

* https://facebook.github.io/react/docs/hello-world.html

Some other frameworks/elements that work with/within React.

* https://github.com/mozilla-services/react-jsonschema-form
* https://mozilla-services.github.io/react-jsonschema-form/
* https://github.com/ReactTraining/react-router

## Notes

**React** is a declarative, component-based library for building user interfaces. The components in which React provides take data and then executes a `render()` function that builds and returns what to display.

Inside the React library there is a feature called the *virtual DOM* which is used to render components. React keeps two copies of this virtual DOM in action, one for what is rendered and one that is used for updated versions of the view. When rendering new elements, React executes a diff between the original and updated version, then returns the the appropriate operations to provide an updated view.

React has three main areas it brings innovation in:

1. React - It provides a different way to handle event and data binding with components.
2. Virtual DOM - This provides React with its power for fast rendering, and related architectural differences. It's also what enables the ability to have simple points of state and render the view according to this within the browser DOM.
3. Components - the design around components provides a way in which to break down the overall design, organization, and implmentation of applications within React.

JSX, or JavaScript eXtension syntax is used for quoting of HTML and HTML tag syntax to render subcomponents.

Other characteristics of React that are important to note: 

* React can be rendered on the server side in addition to the obvious ability to render on the client side.
* Because of the rendering process of the virtual DOM diff and then the push to the browser DOM, the components and properties are immutable.
* The React library is *only the view* of whatever architecture you're using to build your overall application.

Other related to but not React things to know:

* React Native uses libraries to build native iOS, Android, and Universal Windows Platform (UWP) Applications.

## History

Jordan Walke created React working at Facebook. His influence was a PHP Component Framework called XHP. It was deployed first on Facebook in 2011 and then Instagram in 2012. In 2013 React was made open source during the May 2013 JSConf.

***Fini*** That's it for today.
