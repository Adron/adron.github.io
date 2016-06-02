#!/usr/bin/env bash

# Just a title
blogtitle=$1
# Format 2013-04-30
blogdate=$2

echo "$blogtitle"

mkdir "$blogtitle"
cd "$blogtitle"

cat <<EOT >> index.md
---
title: $blogtitle
author: Adron Hall
date: $blogdate
template: article.jade
---
EOT