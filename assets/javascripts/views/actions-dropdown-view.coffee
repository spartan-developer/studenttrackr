define (require) ->
  class ActionsDropdownView extends Backbone.Marionette.ItemView
    className: 'dropdown'
    template: 'actions-dropdown-template'

    events:
      'click .dropdown-menu a.delete': 'delete'

    delete: -> @trigger 'delete'
