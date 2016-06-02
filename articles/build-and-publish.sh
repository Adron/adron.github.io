#!/usr/bin/env bash

cd ~/Codez/adron.github.io/_working/
wintersmith build

cp -r build/ ../../adron.github.io/

cd ~/Codez/adron.github.io/

git add -A
git commit -m "Latest publication."
git push origin master