---
title: Using the File System fs.* with Node.js
author: Adron Hall
date: 2015-11-23
template: article.jade
---
I have a few basic tasks that I need to perform on the file system with Node.js. I'm going to clone a repository into a directory, but before that, if the directory that the clone action will put the repository in exists, I'd like to do something with that directory first. To check for the existence of the directory I quickly found two functions that work well for this purpose.

<span class="more"></span>

First there is the asynchronously executing "exists" function.

```javascript
var fs = require('fs');

fs.exists('/etc/passwd', function (exists) {
  console.log(exists ? "it's there" : 'no passwd!');
});
```

This function takes the path, passed in, then has a callback that can then react to the result which is true or false. A similar function for a synchronous call is available too, called "existsSync".

```javascript
var fs = require('fs');

var result = fs.existsSync(path)

// result will be true or false.
console.log(result);
```

Now there is one major problem with these two functions. Currently, they're marked as "deprecated" with a stability expectation of 0. This means simply, that they're likely to go away in the near future. Now, I hate the idea of using these functions with the idea that I upgrade to a new version one day and my application is nuked. That just isn't really acceptable.

So I go digging around at the other functions that the documentation states to use instead. For the asynchronous fs.exists(path, callback) function it states to use "fs.stat" or "fs.access" instead. Let's take a look at these two first.

The "fs.stat" function is very similar to "fs.exists" in calling signature, it takes a path and a callback to execute. I created the short snippet below to show what this function looks like.

```javascript
var fs = require('fs');

var path2 = 'thisShouldntExist';
var path1 = 'newdirectory';

function myDirectoryExistsCheck (path) {
  fs.stat(path2, function (err, stat) {
    if (err.code === 'ENOENT') {
      console.log('No file asynchronously found.')
    } else if (err) {
      console.log(err)
    } else {
      console.log('File found asynchronously - Mode: ' + stat.mode + ' Size: ' + stat.size);
    }
  });
}

myDirectoryExistsCheck(path1);
myDirectoryExistsCheck(path2);
```

Based on the first call finding a directory and the second call not finding a directory, here's the results I got from this code snippet.

```shell-script
File found asynchronously - Mode: 16877 Size: 102
No file asynchronously found.
```

Based on the first functions, which are now deprecated, the amount of code has ballooned up pretty dramatically over making a standard function call with a true or false result, to something where I have to confirm based off of the data returned in a fs.stats object. I wrote a little console.log code just to show what this object looks like when it is printed out. This...

```javascript
fs.stat(path1, function (err, stat) {
  console.log(stat);
});
```

...prints out this.

```shell-script
{ dev: 16777220,
  mode: 16877,
  nlink: 3,
  uid: 501,
  gid: 20,
  rdev: 0,
  blksize: 4096,
  ino: 10692619,
  size: 102,
  blocks: 0,
  atime: Mon Nov 23 2015 11:23:55 GMT-0800 (PST),
  mtime: Mon Nov 23 2015 11:20:14 GMT-0800 (PST),
  ctime: Mon Nov 23 2015 11:20:14 GMT-0800 (PST),
  birthtime: Mon Nov 23 2015 11:19:40 GMT-0800 (PST) }
```

It's kind of nice to have an object come back with data that one can use to derive a result from, but it's kind of a bummer when all I want to do is write code that checks for existence and returns true or false. Now, in either case, if an error occurs, such as what happens when a file or directory is not found with the "fs.stat" function, the result looks like this.  This...

```javascript
fs.stat(path2, function (err, stat) {
  console.log(err);
});
```

...prints out this.

```shell-script
{ [Error: ENOENT: no such file or directory, stat 'thisShouldntExist']
  errno: -2,
  code: 'ENOENT',
  syscall: 'stat',
  path: 'thisShouldntExist' }
```

Another thing I added, to show two useful functions when there is a file or directory present is shown below.

```javascript
fs.stat(path, function (err, stat) {
  if (err) {
    if (err.code === 'ENOENT') {
      console.log('No file asynchronously found.');
    } else {
      console.log('Some other error occurred.');
    }
  } else {
    console.log('File found asynchronously - Mode: ' + stat.mode + ' Size: ' + stat.size);
    console.log('Other things to checks:');
    console.log('  - ' + stat.isFile());
    console.log('  - ' + stat.isDirectory());
  }
});
```

This of course checks for errors, which will be thrown if there is not a file or directory to find. But if there is, the stat object that is returned asynchronously via the callback has several functions attached, the two that are immediately useful for me are the "isFile()" and "isDirectory()" functions. They're pretty self explanatory.

Now, of course this still means you're writing code to deal with errors instead of what the "fs.exists" functions would do. So really, what needs to be done is a wrapper needs to be written to handle the somewhat basic and crude handling of the file system. But since this is such a common need for many applications, I thought, "hey, time to check and see if there's some npm library bagic that's available!" ...and oddly enough I wasn't impressed by anything I could dig up. Maybe search-fu wasn't so hot. But it looks like I'll be building up this stuff from scratch. With that, happy hacking and I'll be back later with more...
