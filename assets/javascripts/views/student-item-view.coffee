define (require) ->
  
  class StudentItemView extends Backbone.Marionette.ItemView
    tagName: 'tr'
    template: 'student-item-template'

    ui:
      checkbox: 'input[type=checkbox]'

    serializeData: ->
      firstName: @model.get('firstName')
      lastName: @model.get('lastName')
      attributes: @options.attributesToDisplay.map (attribute) =>
        score: @model.get(attribute)
        level: @model.levelOf(attribute)

    check: (checked) ->
      @ui.checkbox.prop('checked', checked)
