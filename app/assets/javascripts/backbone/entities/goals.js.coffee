SmallSteps.module 'Entities', (Entities, App, Backbone, Marionette, $, _) ->

  Entities.Goal = App.Model.Base.extend()

  Entities.Goals = App.Collection.Base.extend

    model: Entities.Goal

    url: '/goals'



  API =
    getGoalsList: (callback) ->
      collection = new Entities.Goals
      collection.fetch
        reset: true
        success: (collection) ->
          callback(collection)

  App.reqres.setHandler 'entities:goals:list', (callback) ->
    API.getGoalsList(callback)
