SmallSteps.module 'GoalsApp.Managment', (Managment, App, Backbone, Marionette, $, _) ->

  Managment.Controller = App.Controllers.Base.extend

    initialize: ->
      {model, collection} = @options

      managmentView = @getFormView(model)

      @listenTo managmentView, 'btn:save:clicked', (goal) ->
        collection.add(goal)
        goal.save()

      @show managmentView

    getFormView: (model) ->
      viewModel = model ? new App.Entities.Goal()
      new Managment.FormView
        model: viewModel



