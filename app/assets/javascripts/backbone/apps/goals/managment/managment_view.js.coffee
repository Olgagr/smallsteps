SmallSteps.module 'GoalsApp.Managment', (Managment, App, Backbone, Marionette, $, _) ->

  Managment.FormView = App.Views.Layout.extend

    template: 'goals/managment/templates/form'

    events:
      'click [data-type="close"]' : 'closeModal'
      'submit form'               : 'onSave'

    regions:
      categoriesRegion: '#categories-region'

    onSave: (e) ->
      e.preventDefault()
      @model.set(Backbone.Syphon.serialize(@))
      @trigger 'btn:save:clicked', @model
      @closeModal()

    onShow: ->
      @$el.foundation('forms')
      categoriesView = @_getCategoriesView()

      @listenTo categoriesView, 'categories:category:selected', =>
        @$('#category-autocomplete').val('')

      @categoriesRegion.show categoriesView


    serializeData: ->
      _.defaults(@model.toJSON(),
        year          : moment().year()
        month         : moment().month() + 1
        week          : moment().week()
        parentsGoals  : @options.parentsGoals
      )

    _getCategoriesView: ->
      new Managment.CategoriesView
        collection: new App.Entities.Categories



  Managment.CategoryView = App.Views.ItemView.extend

    template: 'goals/managment/templates/category'

    tagName: 'li'

    className: 'label'


  Managment.CategoriesView = App.Views.CompositeView.extend

    template: 'goals/managment/templates/categories'

    className: 'large-6 columns'

    itemViewContainer: '#categories-labels'

    itemView: Managment.CategoryView

    onShow: ->
      @$('#category-autocomplete').autocomplete(
        serviceUrl: '/api/categories.json'
        onSelect: (suggestion) =>
          @trigger 'categories:category:selected'
          @collection.add
            name  : suggestion.value
            id    : suggestion.data
        transformResult: (response) ->
          resp = $.parseJSON(response)
          suggestions: $.map(resp, (item) ->
            value : item.name
            data  : item.id
          )
      )


  Managment.DeletePromptView = App.Views.ItemView.extend

    template: 'goals/managment/templates/delete_prompt'

    events:
      'click [data-type="close"]'   : 'closeModal'
      'click [data-type="delete"]'  : 'onDelete'

    onDelete: ->
      @trigger 'btn:delete:clicked', @model
      @closeModal()



