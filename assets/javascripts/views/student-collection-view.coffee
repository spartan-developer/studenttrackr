define (require) ->
  StudentItemView = require './student-item-view'

  class StudentCollectionView extends Backbone.Marionette.CompositeView
    template: 'student-collection-template'
    itemViewContainer: 'tbody'
    itemView: StudentItemView

    events:
      'change th input[type=checkbox]': 'toggleSelected'

    attributesToDisplay: ['progress', 'mastery', 'attendance']

    itemViewOptions: ->
      attributesToDisplay: @attributesToDisplay

    serializeData: ->
      attributesToDisplay: @attributesToDisplay

    toggleSelected: (e) ->
      @children.each (itemView) ->
        itemView.check(e.target.checked)

    deleteSelected: ->
      @children.each (itemView) ->
        if itemView.ui.checkbox.is(':checked')
          itemView.model.destroy()
