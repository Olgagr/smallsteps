SmallSteps.module 'GoalsApp.Managment', (Managment, App, Backbone, Marionette, $, _) ->

  Managment.Controller = App.Controllers.Base.extend

    initialize: ->
      {@model, @collection} = @options

    manageGoal: ->
      managmentView = @getFormView(@model)

      @listenTo managmentView, 'btn:save:clicked', (goal) ->
        if goal.isNew()
          @collection.add(goal)
        goal.save()

      @show managmentView

    deleteGoal: ->
      deletePromptView = @getDeletePromptView(@model)

      @listenTo deletePromptView, 'btn:delete:clicked', (goal) ->
        goal.destroy()

      @show deletePromptView


    getFormView: (model) ->
      viewModel = model ? new App.Entities.Goal()
      new Managment.FormView
        model: viewModel

    getDeletePromptView: (model) ->
      new Managment.DeletePromptView
        model: model



