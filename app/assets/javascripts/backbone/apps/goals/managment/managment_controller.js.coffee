SmallSteps.module 'GoalsApp.Managment', (Managment, App, Backbone, Marionette, $, _) ->

  Managment.Controller = App.Controllers.Base.extend

    initialize: (options) ->
      managmentView = new Managment.FormView
      @show managmentView

