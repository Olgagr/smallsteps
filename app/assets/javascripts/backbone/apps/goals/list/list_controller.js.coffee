SmallSteps.module 'GoalsApp.List', (List, App, Backbone, Marionette, $, _) ->

  List.Controller = App.Controllers.Base.extend

    initialize: ->
      App.request 'entities:goals:list', (goals) =>
        listView = @getGoalsListView(goals)
        @show listView

    getGoalsListView: (goals) ->
      new List.GoalsList
        collection: goals
