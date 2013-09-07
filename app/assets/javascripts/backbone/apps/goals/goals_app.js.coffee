SmallSteps.module 'GoalsApp', (GoalsApp, App, Backbone, Marionette, $, _) ->

  GoalsApp.Router = Marionette.AppRouter.extend

    appRoutes:
      'pages/goals' : 'goalsList'
      'goals/yearly': 'yearlyGoals'


  API =
    goalsList: ->
      new GoalsApp.List.Controller

    yearlyGoals: ->
      log 'yearly goals'

    manageGoal: (args) ->
      controller = new GoalsApp.Managment.Controller _.extend(region: App.modalRegion, args)
      controller.manageGoal()

    deleteGoal: (args) ->
      controller = new GoalsApp.Managment.Controller _.extend(region: App.modalRegion, args)
      controller.deleteGoal()

  App.addInitializer ->
    new GoalsApp.Router
      controller: API

  App.vent.on 'goals:subnav:clicked', (link) ->
    App.navigate link.attr('href'), { trigger: true }

  App.vent.on 'add:goal:clicked', (args) ->
    API.manageGoal args

  App.vent.on 'edit:goal:clicked', (args) ->
    API.manageGoal args

  App.vent.on 'delete:goal:clicked', (args) ->
    API.deleteGoal args