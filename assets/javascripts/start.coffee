define (require) ->
  templates = require 'templates'
  StudentCollection = require 'collections/student-collection'
  TotalsView = require 'views/totals-view'
  ChartsView = require 'views/charts-view'
  StudentListLayout = require 'views/student-list-layout'

  Chance = require 'Chance'
  chance = new Chance()

  Backbone.Marionette.Renderer.render = (templateName, data) ->
    if templateName
      templates[templateName](data)

  window.app = new Backbone.Marionette.Application()

  String.prototype.capitalize = ->
    @charAt(0).toUpperCase() + @slice(1)

  app.addRegions
    totalsRegion: '#totals-region'
    listRegion: '#student-list-region'
    statisticsRegion: '#charts-region'

  app.on 'start', ->
    localStorage.clear()
    students = new StudentCollection()
    for i in [0..20]
      students.create
        firstName: chance.first()
        lastName: chance.last()
        progress: chance.integer(min: -50, max: 50)
        mastery: chance.integer(min: 25, max: 95)
        attendance: chance.integer(min: 0, max: 100)
        achievement: chance.integer(min: 0, max: 100)
        compliance: chance.integer(min: 0, max: 100)
    students.fetch()
    studentListLayout = new StudentListLayout(collection: students)
    app.listRegion.show(studentListLayout)

    app.totalsRegion.show(new TotalsView(collection: students))

    chartsView = new ChartsView(collection: students)
    app.statisticsRegion.show(chartsView)

    $('#closer, #opener').click -> $('body').toggleClass('stats-closed')

  app.start()

