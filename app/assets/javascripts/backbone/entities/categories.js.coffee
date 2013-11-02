SmallSteps.module 'Entities', (Entities, App, Backbone, Marionette, $, _) ->

  Entities.Category = App.Model.Base.extend()

  Entities.Categories = App.Collection.Base.extend

    model: Entities.Category