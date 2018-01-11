---
title: Linux (*nix) 101 Topics - wget and curl
author: Adron Hall
date: 2018-01-10:17:07:11
template: doc.jade
---
The following documentation is something I've put together detailing some basic definition, history, and usage of the commands `wget` and `curl`.

> `wget` or GNU Wget, is a program that retrieves web server content via HTTP, HTTPS, and FTP. It includes features around recursive download, link conversion for offline viewing, and proxy support. It appeared in 1996 and quickly became widely used on Unix systems and because a regular program distributed on various Linux distributions. Wget has also been ported to Windows, OS-X/MacOS, OpenVMS, HP-UX, MorphOS, and AmigaOS.

**Examples:**

The following are some examples of `wget` usage to download content.

The following commamnd downloads the content located at http://blog.adron.me into a file called index.html. This download is done via http, as the URI path would suggest.

`wget http://blog.adron.me/`

The `wget` command can be used for FTP too, as this example shows getting a file from an FTP server.

`wget ftp://ftp.gnu.org/pub/gnu/wget/wget-latest.tar.gz`

One interesting technique with FTP is globbing, which works to download a specific type of file from a particular location.

`wget -e robots=off -r -l 1 --no-parent -A .gif ftp://myftp.adron.me/dir/`

If you download the site at the first example, one will notice upon viewing index.html that the references to images, css, and other collateral don't line up to their respective paths. To fix this `wget` can be used to remap the images, style sheets, and other collateral to align correctly with the following command.

`wget -p -k http://blog.adron.me/`

Now when viewing the index.html page the various assets should display appropriately. 

The following command takes things to the next level, and will download the entire content of `http://blog.adron.me/`, which beware, may take you a while if you try to run it.

`wget -r -l 0 http://blog.adron.me/`

For more information on `wget` check out the GNU [documentation here](https://www.gnu.org/software/wget/manual/). For the above examples and more information regarding the history and definition of wget, check out the [Wikipedia Article](https://en.wikipedia.org/wiki/Wget). There are a lot of powerful features of `wget`, so for whatever need around downloading you have it likely has options for what you need.

> `curl` is a free open source tool used for command line use and scripting in the transfer of data. `curl` is both a library and CLI tool, which is most commonly cased as cURL, and includes the libcurl and cURL products produced by the cURL Project.

The library libcurl is a portable library that can be used on most systems including; AIX, AmigaOS, Android, BeOS, BlackBerry, FreeBSD, Solaris, Unix, Windows, and many others.

cURL is the command line tool, executed as `curl`, for getting or sending files usig URL syntax.

**Examples:**

An example of `curl` usage is as follows.

`curl blog.adron.me`

This downloads the content directly as standard output to the command line. To download the content into a file, like index.html, use the -O switch.

`curl -O index.html blog.adron.me`

For more on `curl` check out this [page](https://curl.haxx.se) and the [documentation](https://curl.haxx.se/docs/manpage.html).
