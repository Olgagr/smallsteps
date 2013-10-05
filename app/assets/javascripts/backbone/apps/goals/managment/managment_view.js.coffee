SmallSteps.module 'GoalsApp.Managment', (Managment, App, Backbone, Marionette, $, _) ->

  Managment.FormView = App.Views.ItemView.extend

    template: 'goals/managment/templates/form'

    events:
      'click [data-type="close"]' : 'closeModal'
      'submit form'               : 'onSave'

    onSave: (e) ->
      e.preventDefault()
      @model.set(Backbone.Syphon.serialize(@))
      @trigger 'btn:save:clicked', @model
      @closeModal()

    onShow: ->
      @$el.foundation('forms')

    serializeData: ->
      _.defaults(@model.toJSON(),
        goalType: @options.goalType
        year    : moment().year()
        month   : moment().month() + 1
        week    : moment().week()
      )

    templateHelpers:
      isGoalYearly: ->
        @goalType is App.GOALS_TYPES.YEARLY

      isGoalMonthly: ->
        @goalType is App.GOALS_TYPES.MONTHLY

      isGoalWeekly: ->
        @goalType is App.GOALS_TYPES.WEEKLY


  Managment.DeletePromptView = App.Views.ItemView.extend

    template: 'goals/managment/templates/delete_prompt'

    events:
      'click [data-type="close"]'   : 'closeModal'
      'click [data-type="delete"]'  : 'onDelete'

    onDelete: ->
      @trigger 'btn:delete:clicked', @model
      @closeModal()



