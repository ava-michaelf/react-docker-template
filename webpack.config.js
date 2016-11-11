const path = require('path');
const webpack = require('webpack');
const validate = require('webpack-validator');

const PATHS = {
    src: path.join(__dirname, 'src'),
    style: path.join(__dirname, 'src/style'),
    build: path.join(__dirname, 'build'),
    images: path.join(__dirname, 'src/style/images')
};

const config = {
  entry: {
    "main": PATHS.src + '/entry.js'
  },
  externals: {
    'react/addons': true,
    'react/lib/ExecutionEnvironment': true,
    'react/lib/ReactContext': true
  },
  devServer: {
    hot: true,
    inline: true,
    port: 3000,
    historyApiFallback: true
  },
  output: {
      path: PATHS.build,
      filename: '[name].bundle.js',
  },
  plugins: [
      new webpack.EnvironmentPlugin(['NODE_ENV'])
  ],
  module: {
     loaders: [
       {
         test: /\.jsx?$/,
         loader: 'babel-loader',
         query: {
           presets: [
             'babel-preset-es2015',
             'babel-preset-react',
             'babel-preset-stage-0'
           ].map(require.resolve),
           plugins: [
            'transform-class-properties',
            'transform-decorators-legacy',
            'react-html-attrs',
            'transform-function-bind'
           ]
         },
         include: PATHS.src
       },

       { 
         test: /\.css$/, 
         loader: "style-loader!css-loader!postcss-loader"
       },
       { test: /\.woff(2)?(\?v=[0-9]\.[0-9]\.[0-9])?$/, loader: "url-loader?limit=10000&minetype=application/font-woff"},
       { test: /\.(ttf|eot|svg)(\?v=[0-9]\.[0-9]\.[0-9])?$/, loader: "file-loader" },
        {
          test: /\.scss$/,
          loaders: ['style', 'css', 'sass']
        },
        {
          test: /\.(jpg|png)$/,
          loader: 'url?limit=25000',
          include: PATHS.images
        }
     ]
  }
};

module.exports = validate(config);
