#!/bin/bash

# set current working directory to directory of the shell script
cd "$(dirname "$0")"

# before
npm ci 2> /dev/null || npm i

# copy
cp node_modules/@panzoom/panzoom/dist/panzoom.min.js ../../vendor/panzoom.min.js

# after
rm -rf node_modules/
