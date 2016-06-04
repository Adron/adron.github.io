#!/usr/bin/env bash
commitMessage=$1

if [ ! $# == 1 ]
    then
    echo "There should a commit message for this publishing of material."
    exit 1
fi

cd ~/Codez/adron.github.io/_working/
wintersmith build

cp -r build/ ../../adron.github.io/

cd ~/Codez/adron.github.io/

git add -A
git commit -m "$commitMessage"
git push origin master