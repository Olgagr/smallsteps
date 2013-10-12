SmallSteps.module 'GoalsApp.List', (List, App, Backbone, Marionette, $, _) ->

  List.Controller = App.Controllers.Base.extend

    initializeViews: (goals) ->
      @layoutView = @getLayoutView(goals)

      @listenTo @layoutView, 'goals:subnav:clicked', (link) =>
        App.vent.trigger 'goals:subnav:clicked', link
        @refreshGoalsList link.data()

      @listenTo @layoutView, 'add:goal:clicked', (args) ->
        App.vent.trigger 'add:goal:clicked', args

      @listenTo @layoutView, 'show', =>
        @goalsListView = @getGoalsListView(goals)

        @listenTo @goalsListView, 'edit:goal:clicked', (args) ->
          App.vent.trigger 'edit:goal:clicked', args

        @listenTo @goalsListView, 'itemview:delete:goal:clicked', (view, obj) ->
          App.vent.trigger 'delete:goal:clicked', obj

        @layoutView.goalsContentRegion.show @goalsListView

      @show @layoutView


    getGoalsList: (goal_range) ->
      collection = new App.Entities.Goals()
      App.request 'entities:goals:list', collection, goal_range, =>
        @initializeViews collection

    refreshGoalsList: (goal_range) ->
      App.request 'entities:goals:list', @goalsListView.collection, goal_range

    getLayoutView: (goals) ->
      new List.GoalsLayout
        collection: goals

    getGoalsListView: (goals) ->
      new List.GoalsList
        collection: goals
