axis         = require 'axis'
rupture      = require 'rupture'
autoprefixer = require 'autoprefixer-stylus'
dynamic      = require 'dynamic-content'
js_pipeline  = require 'js-pipeline'
css_pipeline = require 'css-pipeline'

require('string').extendPrototype()

module.exports =
  ignores: ['readme.md', '**/layout.*', '**/_*', '.gitignore']

  stylus:
    use: [axis(), rupture(), autoprefixer()]

  extensions: [
    dynamic(),
    css_pipeline(manifest: 'assets/css/manifest.yml', out: 'css/build.css', minify: true)
    js_pipeline(manifest: 'assets/js/manifest.yml', out: 'js/build.js', minify: true)
  ]


