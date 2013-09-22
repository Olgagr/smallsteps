SmallSteps.module 'Entities', (Entities, App, Backbone, Marionette, $, _) ->

  Entities.Goal = App.Model.Base.extend

    rootUrl: '/api/goals'

  Entities.Goals = App.Collection.Base.extend

    model: Entities.Goal

    url: '/api/goals'



  API =
    getGoalsList: (goal_range, callback) ->
      collection = new Entities.Goals
      collection.fetch
        reset: true
        data: goal_range
        success: (collection) ->
          callback collection

    getYearlyGoals: (year, callback) ->
      collection = new Entities.Goals
      collection.fetch
        reset: true
        url: "/api/goals/yearly/#{year}"
        success: (collection) ->
          callback collection

  App.reqres.setHandler 'entities:goals:list', (goal_range, callback) ->
    API.getGoalsList goal_range, callback

  App.reqres.setHandler 'entities:yearly_goals:list', (year, callback) ->
    API.getYearlyGoals year, callback
