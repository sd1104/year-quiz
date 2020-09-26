const { environment } = require('@rails/webpacker')
const { VueLoaderPlugin } = require('vue-loader')
const vue = require('./loaders/vue')

environment.plugins.prepend('VueLoaderPlugin', new VueLoaderPlugin())
environment.loaders.prepend('vue', vue)
const webpack = require('webpack')
const path = require('path');
const fs = require('fs');

const nodeModules = {};
fs.readdirSync('node_modules')
  .filter(function(x) {
    return ['.bin'].indexOf(x) === -1;
  })
  .forEach(function(mod) {
    nodeModules[mod] = 'commonjs ' + mod;
  });

module.exports = {
  entry: '/Users/satouhiroshi/projects/year-quiz/app/javascript/packs/hello_vue.js',
  output: {
    path: path.join(__dirname, 'build'),
    filename: 'backend.js'
  },
  externals: nodeModules
}
environment.plugins.append(
    'Provide',
    new webpack.ProvidePlugin({
        jQuery: 'jquery/dist/jquery',
        Popper: 'popper.js/dist/popper'
    })
)
module.exports = environment
