#!/bin/bash

# set current working directory to directory of the shell script
cd "$(dirname "$0")"

# before
npm ci 2> /dev/null || npm i
mkdir -p tmp

# remark.min.js
npx rollup --config rollup.mjs --input remark.mjs --file tmp/remark.js
npx terser --compress --mangle -- tmp/remark.js > tmp/remark.min.js

# copy
cp tmp/remark.min.js ../../vendor/

# after
rm -rf node_modules/ tmp/
