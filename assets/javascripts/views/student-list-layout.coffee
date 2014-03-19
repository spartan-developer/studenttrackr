define (require) ->
  StudentCollectionView = require 'views/student-collection-view'
  StudentCollection     = require 'collections/student-collection'
  SortbyDropdownView    = require 'views/sortby-dropdown-view'
  DisplayDropdownView   = require 'views/display-dropdown-view'
  ActionsDropdownView   = require 'views/actions-dropdown-view'
  
  class StudentListLayout extends Backbone.Marionette.Layout
    id: 'student-list-layout'
    template: 'student-list-layout-template'

    regions:
      actionRegion: '#action-dropdown-region'
      sortRegion: '#sort-dropdown-region'
      displayRegion: '#display-dropdown-region'
      studentListRegion: '#student-list-region'

    initialize: ->
      super
      @studentCollectionView = new StudentCollectionView(collection: @collection)

      @displayDropdownView = new DisplayDropdownView(selected: @studentCollectionView.attributesToDisplay)

      @displayDropdownView.on 'selectionchanged', (attributes) =>
        @studentCollectionView.attributesToDisplay = attributes
        @studentCollectionView.render()
        app.trigger 'displaying', attributes

      @sortbyView = new SortbyDropdownView
        selectedAttribute: 'firstName'
        sortableFields:
          lastName: 'Student Name'
          progress: 'Progress'
          mastery: 'Mastery'
          attendance: 'Attendance'
          achievement: 'Achievement'
          compliance: 'Compliance'

      @sortbyView.on 'sortby', (sortAttribute) =>
        @collection.comparator = sortAttribute
        @collection.sort()
        @studentCollectionView.render()

      @actionsDropdownView = new ActionsDropdownView()
      @actionsDropdownView.on 'delete', =>
        @studentCollectionView.deleteSelected()

    onRender: ->
      @sortRegion.show(@sortbyView)
      @displayRegion.show(@displayDropdownView)
      @studentListRegion.show(@studentCollectionView)
      @actionRegion.show(@actionsDropdownView)
