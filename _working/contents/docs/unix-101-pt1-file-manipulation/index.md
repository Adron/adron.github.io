---
title: Linux (*nix) 101 Topics - File Manipulation
author: Adron Hall
date: 2016-07-02:17:45:26
template: doc.jade
---
The following is a list of the rudimentary commands for Linux and Unix to copy, move, list, review, and otherwise manage and maintain the files and directories on the Linux or Unix machine.

> The `ls` command lists the files in a directory, and with certain switches will list permissions, size, date craeted, and various other information. The `ls` has a number of switches, which I've shown in the following examples.

**Examples:**

```
adrons@workstation-machine$ ls
a-directory-here  some-file         the-new-filename.txt
empty-file.txt    some-markdown.md
adrons@workstation-machine$ ls -a
.   a-directory-here  .gitignore     some-file         the-new-filename.txt
..  empty-file.txt    .hidden-file1  some-markdown.md
adrons@workstation-machine$ ls -la
total 12
drwxrwxr-x  3 adron adron 4096 Dec 10 02:58 .
drwxrwxr-x 19 adron adron 4096 Dec 10 02:47 ..
drwxrwxr-x  2 adron adron 4096 Dec 10 02:48 a-directory-here
-rw-rw-r--  1 adron adron    0 Dec 10 02:55 empty-file.txt
-rw-rw-r--  1 adron adron    0 Dec 10 02:58 .gitignore
-rw-rw-r--  1 adron adron    0 Dec 10 02:58 .hidden-file1
-rw-rw-r--  1 adron adron    0 Dec 10 02:58 some-file
-rw-rw-r--  1 adron adron    0 Dec 10 02:54 some-markdown.md
-rw-rw-r--  1 adron adron    0 Dec 10 02:55 the-new-filename.txt
adrons@workstation-machine$ ls -l
total 4
drwxrwxr-x 2 adron adron 4096 Dec 10 02:48 a-directory-here
-rw-rw-r-- 1 adron adron    0 Dec 10 02:55 empty-file.txt
-rw-rw-r-- 1 adron adron    0 Dec 10 02:58 some-file.txt
-rw-rw-r-- 1 adron adron    0 Dec 10 02:54 some-markdown.md
-rw-rw-r-- 1 adron adron    0 Dec 10 02:55 the-new-filename.txt
adrons@workstation-machine$ ls -t
some-file.txt         empty-file.txt    a-directory-here
the-new-filename.txt  some-markdown.md
adrons@workstation-machine$ ls -u
some-file.txt   the-new-filename.txt  a-directory-here
empty-file.txt  some-markdown.md
adrons@workstation-machine$ ls -s
total 4
4 a-directory-here  0 some-file.txt     0 the-new-filename.txt
0 empty-file.txt    0 some-markdown.md
adrons@workstation-machine$ ls -r
the-new-filename.txt  some-file.txt   a-directory-here
some-markdown.md      empty-file.txt
```

Here are some of the most commonly used switches with `ls`.

* -a  all files (include files with . prefix)
* -l  long detail (provide file statistics)
* -t  order by creation time
* -u  sort by access time (or show when last accessed together with -l)
* -S  order by size
* -r  reverse order
* -s  show filesizes
* -h  "human readble"; show filesizes in kilobytes and megabytes (-h can be used together with -l or -s)

> `mv` this moves a file from one location to another, or can be used to rename a file. Use `mv -i` to prevent overwriting files with move.

**Examples:**

```
adrons@workstation-machine$ ls
a-directory-here  some-file         the-new-filename.txt
empty-file.txt    some-markdown.md
adrons@workstation-machine$ mv some-file some-file.txt
adrons@workstation-machine$ ls
a-directory-here  some-file.txt     the-new-filename.txt
empty-file.txt    some-markdown.md
adrons@workstation-machine$ 
```

> `rm` this command removes a file. Use `rm -i` for interactive prompt to confirm deletions.

**Example:**

```
adrons@workstation-machine$ ls
a-directory-here  some-file.txt     the-new-filename.txt
empty-file.txt    some-markdown.md
adrons@workstation-machine$ rm some-file.txt 
adrons@workstation-machine$ rm some-markdown.md 
adrons@workstation-machine$ ls
a-directory-here  empty-file.txt  the-new-filename.txt
```

> `touch` this will create an empty file named whatever the passed in value is.

**Example:**

```
adrons@workstation-machine$ touch empty-file.txt
adrons@workstation-machine$ touch some-markdown.md
adrons@workstation-machine$ ls -a
.  ..  a-directory-here  empty-file.txt  some-markdown.md
```

> `cp` this command copies a file X to Y. Use `cp -i` to prevent overwriting files when copying.

**Example:**

```
adrons@workstation-machine$ touch empty-file.txt
adrons@workstation-machine$ cp empty-file.txt the-new-filename.txt
adrons@workstation-machine$ ls -a
.  ..  a-directory-here  empty-file.txt  the-new-filename.txt
```

> `mkdir` this command creates a specified directory.

**Example:**

```
mkdir some-directory-name-here
```

> `rmdir` this command removes the specified directory.

**Example:**

```
adrons@workstation-machine$ rmdir simplepath/
adrons@workstation-machine$ ls -a
.  ..  a-directory-here
```

> `df` reports the amount of free disk space available on each partition. `df -h` Reports disk usage in human readable format with block-sizes in Kilo, Mega, & Gigabytes. `df -P /usr/src` provides information for that particular path.

> `du` this command reports disk usage. The `du` command descends directories from the path the command is executed at. `du -k` usually lists the directories in kilobytes.

**Examples:**

```
adrons@workstation-machine$ mkdir simplepath
adrons@workstation-machine$ ls -a
.  ..  a-directory-here  simplepath
adrons@workstation-machine$ du 
4	./a-directory-here
4	./simplepath
12	.
adrons@workstation-machine$ df ./simplepath/
Filesystem                  1K-blocks      Used Available Use% Mounted on
/dev/mapper/ubuntu--vg-root 927428120 332217068 548077356  38% /
adrons@workstation-machine$ df -h ./simplepath/
Filesystem                   Size  Used Avail Use% Mounted on
/dev/mapper/ubuntu--vg-root  885G  317G  523G  38% /
adrons@workstation-machine$ 
```
