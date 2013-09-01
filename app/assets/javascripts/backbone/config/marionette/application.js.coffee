do (Backbone) ->

  _.extend Backbone.Marionette.Application::,

    register: (instance, id) ->
      @_registry ?= {}
      @_registry[id] = instance

    unregister: (instance, id) ->
      delete @_registry[id]

    resetRegistry: ->
      oldSize = @getRegistrySize()
      for key, controller of @_registry
        controller.region.close()
      msg = "There were #{oldSize} controllers in registry, the are now #{@getRegistrySize()}"
      if @getRegistrySize() > 0 then console.warn(msg) else console.log(msg)

    getRegistrySize: ->
      _.size @_registry

    navigate: (url, options) ->
      Backbone.history.navigate url, options



