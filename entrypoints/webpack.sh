#!/bin/bash
# runs webpack on /react directory

# The environment: should be one of local, dev, or prod
export NODE_ENV=${NODE_ENV:-local}

# remove all build content. a fresh build will be generated
# from src by webpack
rm -rf /react/build/*

# copy index template into build
cp /react/index.html.template /react/build/index.html

# remove all local node modules and copy global node modules
# to local scope.  this will ensure local node modules
# are consistent with docker build
rm -rf /react/node_modules

# Copy the global npm modules into the local container.
# We need to do this because we have mounted the git repo
# as a volume
cp -a /usr/local/lib/node_modules /react

# Go to the /react dir (mounted as repo) and run webpack.
# Webpack will monitor the /src directory, and write transpiled
# code to /build whenever you save changes.
cd /react

exec webpack
