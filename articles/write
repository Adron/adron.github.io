#!/usr/bin/env bash

# Just a title
blogtitle=$1
# Format 2013-04-30
blogdate=$2

if [ ! $# == 2 ]
    then
    echo "There should be two arguments."
    exit 1
fi

echo "Creating $blogtitle."
mkdir "$blogtitle"
cd "$blogtitle"

# Takes out the dashes. Still needs title cased.
cleanedTitle=${blogtitle//[-]/' '}

cat <<EOT >> index.md
---
title: $cleanedTitle
author: Adron Hall
date: $blogdate
template: article.jade
---

![Node PDX 2016](nodepdx-2016-logo.png)

<span class="more"></span>

EOT