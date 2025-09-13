#!/bin/bash

# set current working directory to directory of the shell script
cd "$(dirname "$0")"

# before
npm ci 2> /dev/null || npm i
mkdir -p tmp

# marked.min.js
npx rollup --config rollup.mjs --input marked.mjs --file tmp/marked.js
npx terser --compress --mangle -- tmp/marked.js > tmp/marked.min.js

# copy
cp tmp/marked.min.js ../../vendor/

# after
rm -rf node_modules/ tmp/
