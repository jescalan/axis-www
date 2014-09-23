axis         = require 'axis'
rupture      = require 'rupture'
autoprefixer = require 'autoprefixer-stylus'
jeet         = require 'jeet'
dynamic      = require 'dynamic-content'

module.exports =
  ignores: ['readme.md', '**/layout.*', '**/_*', '.gitignore', 'sections/**']

  stylus:
    use: [axis(), rupture(), jeet(), autoprefixer()]

  extensions: dynamic()

  locals:
    capitalize: (str) -> str.charAt(0).toUpperCase() + str.slice(1);
