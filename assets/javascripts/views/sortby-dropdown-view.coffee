define (require) ->
  class SortbyDropdownView extends Backbone.Marionette.ItemView
    className: 'dropdown'
    template: 'sortby-dropdown-template'

    events:
      'click .dropdown-menu a': 'itemSelected'

    itemSelected: (e) ->
      if $(e.target).parent().hasClass('disabled')
        e.stopPropagation()
      else
        sortAttribute = $(e.target).data('sort') || $(e.target).text().toLowerCase()
        @trigger 'sortby', sortAttribute
        @$('li').removeClass('disabled')
        $(e.target).parent().addClass('disabled')

    serializeData: ->
      sortableFields: _.map _.pairs(@options.sortableFields), (attributeAndLabel) ->
        attribute: attributeAndLabel[0]
        label: attributeAndLabel[1]

    onRender: ->
      @$("a[data-sort=#{@options.selectedAttribute}]").parent().addClass('disabled')
