require
  deps: ['start']
  urlArgs: "b=#{(new Date()).getTime()}"
  paths:
    jquery: 'vendor/jquery/jquery'
    underscore: 'vendor/lodash/lodash.compat'
    backbone: 'vendor/backbone/backbone'
    'backbone.localstorage': 'vendor/backbone.localstorage/backbone.localStorage'
    'backbone.wreqr': 'vendor/backbone.wreqr/backbone.wreqr'
    'backbone.babysitter': 'vendor/backbone.babysitter/backbone.babysitter'
    marionette: 'vendor/marionette/backbone.marionette'
    Chance: 'vendor/chance/chance'
    bootstrap: 'vendor/bootstrap/bootstrap'
  shim:
    'backbone.babysitter': deps: ['backbone', 'underscore']
    bootstrap: deps: ['jquery']
    start:
      deps: [
        'marionette'
        'backbone.localstorage'
        'bootstrap'
      ]
