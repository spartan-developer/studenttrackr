define (require) ->
  Student = require 'models/student-model'
  
  class StudentCollection extends Backbone.Collection
    model: Student

    localStorage: new Backbone.LocalStorage('students')

    initialize: ->
      @on 'sync', @calculateMaxMeasurement

    calculateMaxMeasurement: =>
      @
