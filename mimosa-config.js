exports.config = {
  "modules": [
    "copy",
    "server",
    "jshint",
    "csslint",
    "require",
    "minify-js",
    "minify-css",
    "live-reload",
    "bower",
    "coffeescript",
    "less",
    "jade"
  ],
  bower: {
    copy: {
      mainOverrides: {
        'underscore.string': ['lib/underscore.string.js']
      }
    }
  }
}
