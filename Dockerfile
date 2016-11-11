FROM node:slim
MAINTAINER mac <mac.gainor@gmail.com>

ADD . /react

WORKDIR /react

RUN npm install -g react --save && \
    npm install -g react-dom --save && \
    npm install -g flux --save && \
    npm install -g babel-core --save-dev && \
    npm install -g babel-loader --save-dev && \
    npm install -g babel-preset-react --save-dev && \

    npm install -g babel-plugin-transform-function-bind --save-dev && \
    npm install -g babel-plugin-transform-class-properties --save-dev && \
    npm install -g babel-plugin-transform-decorators-legacy --save-dev && \
    npm install -g babel-plugin-react-html-attrs --save-dev && \

    npm install -g babel-preset-stage-0 --save-dev && \
    npm install -g babel-preset-es2015 --save-dev && \
    npm install -g webpack --save-dev && \
    npm install -g css-loader --save-dev && \
    npm install -g url-loader --save-dev && \
    npm install -g file-loader --save-dev && \
    npm install -g style-loader --save-dev && \
    npm install -g react-hot-loader --save-dev && \
    npm install -g webpack-dev-server --save-dev && \
    npm install -g webpack-validator --save-dev && \
    npm install -g sass-loader --save-dev && \
    npm install -g node-sass --save-dev && \
    npm install -g jquery --save && \
    npm install -g bootstrap@3 --save && \
    npm install -g font-awesome --save && \

    npm install -g bootstrap-loader --save-dev && \
    npm install -g bootstrap-sass --save-dev && \
    npm install -g react-bootstrap --save && \

    npm install -g postcss-loader --save && \

    npm install -g react-router --save && \
    npm install -g babel-register --save && \
    npm install -g enzyme --save && \
    npm install -g ignore-styles --save && \
    npm install -g mocha --save && \
    npm install -g chai --save && \
    npm install -g jsdom --save && \
    npm install -g react-addons-test-utils --save && \
    npm install -g history --save

EXPOSE 3000
ENTRYPOINT ["/react/entrypoints/build.sh"]

