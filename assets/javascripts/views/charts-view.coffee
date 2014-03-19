define (require) ->
  BarGraphView = require './bar-graph-view'
  
  class ChartsView extends Backbone.Marionette.ItemView
    template: 'charts-template'

    onRender: ->
      maxScore = 0
      for attribute in ['progress', 'mastery', 'attendance', 'achievement', 'compliance']
        countsForAttribute = @collection.countBy (student) -> student.levelOf(attribute)
        maxForAttribute = _.max(_.values(countsForAttribute))
        maxScore = Math.max(maxScore, maxForAttribute)
      
      @charts = []
      for attribute in ['progress', 'mastery', 'attendance', 'achievement', 'compliance'].reverse()
        barGraphView = new BarGraphView
          collection: @collection
          attribute: attribute
          maxScore: maxScore
        @charts.push(barGraphView)
        @$('#mainRow').prepend(barGraphView.render().el)
      @showSelectedCharts()

    selectedAttributes: ['progress', 'mastery', 'attendance']

    initialize: ->
      @collection.on 'remove', @render
      app.on 'displaying', (attributes) =>
        @selectedAttributes = attributes
        @showSelectedCharts()

    showSelectedCharts: ->
      for chart in @charts
        if chart.options.attribute in @selectedAttributes
          chart.$el.show()
        else
          chart.$el.hide()
