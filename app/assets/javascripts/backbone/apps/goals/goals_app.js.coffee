SmallSteps.module 'GoalsApp', (GoalsApp, App, Backbone, Marionette, $, _) ->

  GoalsApp.Router = Marionette.AppRouter.extend

    appRoutes:
      'pages/goals' : 'goalsList'


  API =
    goalsList: ->
      new GoalsApp.List.Controller


  App.addInitializer ->
    new GoalsApp.Router
      controller: API

