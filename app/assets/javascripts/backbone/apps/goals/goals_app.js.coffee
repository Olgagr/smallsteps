SmallSteps.module 'GoalsApp', (GoalsApp, App, Backbone, Marionette, $, _) ->

  GoalsApp.Router = Marionette.AppRouter.extend

    appRoutes:
      '': 'goalsList'
      'pages/goals' : 'goalsList'
      'goals/yearly(/:year)': 'yearlyGoals'


  API =
    goalsList: ->
      controller = new GoalsApp.List.Controller
      controller.getGoalsList 'goals'

    yearlyGoals: (year) ->
      controller = new GoalsApp.List.Controller
      controller.getGoalsList "goals/yearly/#{year}"

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
    App.navigate link

  App.vent.on 'add:goal:clicked', (args) ->
    API.manageGoal args

  App.vent.on 'edit:goal:clicked', (args) ->
    API.manageGoal args

  App.vent.on 'delete:goal:clicked', (args) ->
    API.deleteGoal args