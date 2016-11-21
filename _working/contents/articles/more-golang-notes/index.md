---
title: More Go Language Notes & Observations
author: Adron Hall
date: 2016-11-21
template: article.jade
---
I've been taking a few notes of things to remember while reading up on and learning Go. Some of these things too are just merely observations while toiling samples through the language. Some have left me with "WTF" moments and others have been rather interesting. Overall good stuff...

<span class="more"></span>

Notes: More random Go observations.

* The increment statement i++ adds 1 to i. The equivalent results are also derived from `i += 1`, `i = i + 1`, and there's the respective decrement operator. However, these are statements and no expressions as in most C family languages. So x = i++ is illegal and the statements are only postfix only, no --i or ++i statements.
* Declaring variables can be done in a number of ways, all of these are the same: `s := ""`, `var s string`, `var s = ""`, and `var s string = ""`.
