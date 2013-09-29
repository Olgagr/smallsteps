SmallSteps.module 'GoalsApp.Managment', (Managment, App, Backbone, Marionette, $, _) ->

  Managment.Controller = App.Controllers.Base.extend

    initialize: ->
      {@model, @collection} = @options

    manageGoal: ->
      managmentView = @_getFormView(@model, @_getGoalType())

      @listenTo managmentView, 'btn:save:clicked', (goal) ->
        if goal.isNew()
          @collection.add(goal)
        goal.save()

      @show managmentView

    deleteGoal: ->
      deletePromptView = @_getDeletePromptView(@model)

      @listenTo deletePromptView, 'btn:delete:clicked', (goal) ->
        goal.destroy()

      @show deletePromptView


    _getFormView: (model, goalType) ->
      viewModel = model ? new App.Entities.Goal()
      new Managment.FormView
        model: viewModel
        goalType: goalType

    _getDeletePromptView: (model) ->
      new Managment.DeletePromptView
        model: model

    _getGoalType: ->
      goalType = ''
      url = window.location.pathname.split('/')
      url.splice(0,2)
      switch url.length
        when 1 then goalType = 'yearly'
        when 2 then goalType = 'monthly'
        else goalType = 'weekly'
      goalType



