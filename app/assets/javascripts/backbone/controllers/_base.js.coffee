@SmallSteps.module 'Controllers', (Controllers, App, Backbone, Marionette, $, _) ->

  Controllers.Base = Marionette.Controller.extend

    constructor: (options = {}) ->
      @region = options.region or App.request 'default:region'
      Marionette.Controller::constructor.call(@, options)
      @_instance_id = _.uniqueId('controller')
      App.execute 'register:instance', @, @_instance_id

    close: (args...) ->
      Marionette.Controller::close.apply @, args
      App.execute 'unregister:instance', @, @_instance_id

    show: (view) ->
      @listenTo view, 'close', @close
      @region.show view
