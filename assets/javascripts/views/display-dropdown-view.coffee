define (require) ->
  class DisplayDropdownView extends Backbone.Marionette.ItemView
    template: 'display-dropdown-template'
    className: 'dropdown'

    events:
      'change': 'columnSelected'
      'click .dropdown-menu': (e) -> e.stopPropagation()

    columnSelected: (e) ->
      values = @$(':checked').map(-> $(@).val()).get()
      @trigger 'selectionchanged', values

    serializeData: ->
      isSelected: (attribute) => attribute.toLowerCase() in @options.selected
