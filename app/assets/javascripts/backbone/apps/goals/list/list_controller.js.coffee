SmallSteps.module 'GoalsApp.List', (List, App, Backbone, Marionette, $, _) ->

  List.Controller = App.Controllers.Base.extend

    initialize: ->
      App.request 'entities:goals:list', (goals) =>
        @layoutView = @getLayoutView(goals)

        @listenTo @layoutView, 'goals:subnav:clicked', (link) ->
          App.vent.trigger 'goals:subnav:clicked', link

        @listenTo @layoutView, 'add:goal:clicked', (args) ->
          App.vent.trigger 'add:goal:clicked', args

        @listenTo @layoutView, 'show', =>
          goalsListView = @getGoalsListView(goals)
          @layoutView.goalsContentRegion.show goalsListView

        @show @layoutView


    getLayoutView: (goals) ->
      new List.GoalsLayout
        collection: goals

    getGoalsListView: (goals) ->
      new List.GoalsList
        collection: goals
