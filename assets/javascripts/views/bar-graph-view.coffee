define (require) ->
  
  class BarGraphView extends Backbone.Marionette.ItemView
    template: 'bar-graph-template'
    className: 'col-md-6 col-sm-4'

    onRender: ->
      @$('.thriving .count').text()

    serializeData: ->
      levels = ['thriving', 'below-average', 'approaching-risk', 'at-risk']
      cs = @collection.countBy (student) => student.levelOf(@options.attribute)

      counts: levels.map (level) =>
        level: level
        number: cs[level] || 0
      maxScore: @options.maxScore
      title: @options.attribute.toUpperCase()
