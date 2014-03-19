define (require) ->
  
  class TotalsView extends Backbone.Marionette.ItemView
    template: 'totals-template'

    initialize: ->
      @collection.on 'remove', @render

    serializeData: ->
      counts = @collection.countBy (student) -> student.levelOf('progress')
      console.log counts
      numStudents: @collection.size()
      thriving: (counts['thriving'] || 0) + (counts['below-average'] || 0)
      atRisk: (counts['at-risk'] || 0) + (counts['approaching-risk'] || 0)
