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
      @categoriesRegion.show @_getCategoriesView()



    serializeData: ->
      _.defaults(@model.toJSON(),
        year          : moment().year()
        month         : moment().month() + 1
        week          : moment().week()
        parentsGoals  : @options.parentsGoals
      )

    _getCategoriesView: ->
      new Managment.CategoriesView()


  Managment.CategoriesView = App.Views.CompositeView.extend

    template: 'goals/managment/templates/categories'

    className: 'large-6 columns'

    onShow: ->
      @$('#category-autocomplete').autocomplete(
        serviceUrl: '/api/categories.json'
        onSelect: (suggestion) =>

          @$('#category').val(suggestion.data)
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



