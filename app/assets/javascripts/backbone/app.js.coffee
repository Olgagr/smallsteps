@SmallSteps = do (Backbone, Marionette) ->

  App = new Marionette.Application

  App.addRegions
    mainRegion:   '#main-region'
    modalRegion:
      selector:   '#modal-region'
      regionType: Marionette.Region.Modal

  App.on 'initialize:after', ->
    Backbone.history.start(pushState: true) if Backbone.history

  App.reqres.setHandler 'default:region', ->
    App.mainRegion

  App.commands.setHandler 'register:instance', (instance, id) ->
    App.register instance, id

  App.commands.setHandler 'unregister:instance', (instance, id) ->
    App.unregister instance, id

  App


$(document).ready ->

  $(document).foundation()



