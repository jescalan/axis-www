axis         = require 'axis'
rupture      = require 'rupture'
autoprefixer = require 'autoprefixer-stylus'
jeet         = require 'jeet'
dynamic      = require 'dynamic-content'
js_pipeline  = require 'js-pipeline'

require('string').extendPrototype()

module.exports =
  ignores: ['readme.md', '**/layout.*', '**/_*', '.gitignore', 'sections/**']

  stylus:
    use: [axis(), rupture(), jeet(), autoprefixer()]

  extensions: [
    dynamic(),
    js_pipeline(manifest: 'assets/js/manifest.yml', out: 'js/build.js', minify: true)
  ]


