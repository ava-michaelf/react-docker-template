#!/bin/bash
# Builds output files

export NODE_ENV=${NODE_ENV:-local}

echo Building react site...

# remove build files if they exist,
# otherwise create the build directory
if [ -d /react/build ]; then
    echo Removing build artifacts
    rm -rf /react/build/*
else
    echo Creating build directory
    mkdir /react/build
fi

# copy over the index.html file
cp /react/index.html.template /react/build/index.html

# copy our global node modules
rm -rf /react/node_modules
cp -a /usr/local/lib/node_modules /react

# now, build the site
cd /react
webpack

# ... and copy them to where nginx can serve them up
cp -a /react/build /build
