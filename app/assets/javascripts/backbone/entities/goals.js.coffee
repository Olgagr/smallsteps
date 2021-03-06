SmallSteps.module 'Entities', (Entities, App, Backbone, Marionette, $, _) ->

  Entities.Goal = App.Model.Base.extend

    rootUrl: '/api/goals'

  Entities.Goals = App.Collection.Base.extend

    model: Entities.Goal

    url: '/api/goals'

    parse: (response) ->
      @parentsGoals = new Entities.Goals response.parents_goals
      response.goals

  API =
    getGoalsList: (collection, goal_range, callback) ->
      collection.fetch
        reset: true
        data: goal_range
        success: (collection) ->
          callback?(collection)

  App.reqres.setHandler 'entities:goals:list', (collection, goal_range, callback) ->
    API.getGoalsList collection, goal_range, callback

