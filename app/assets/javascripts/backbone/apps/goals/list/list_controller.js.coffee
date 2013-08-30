SmallSteps.module 'GoalsApp.List', (List, App, Backbone, Marionette, $, _) ->

  List.Controller = App.Controllers.Base.extend

    initialize: ->
      App.request 'entities:goals:list', (goals) =>
        @layoutView = @getLayoutView()

        @listenTo @layoutView, 'goals:subnav:clicked', (link) -> App.vent.trigger 'goals:subnav:clicked', link

        @listenTo @layoutView, 'show', =>
          goalsListView = @getGoalsListView(goals)
          @layoutView.goalsContentRegion.show goalsListView

        @show @layoutView


    getLayoutView: ->
      new List.GoalsLayout()

    getGoalsListView: (goals) ->
      new List.GoalsList
        collection: goals
