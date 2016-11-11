#!/bin/bash
# runs webpack dev server /react directory

cp /react/index.html.template /react/build/index.html
rm -rf /react/node_modules
cp -a /usr/local/lib/node_modules /react
cd /react

exec npm run test
