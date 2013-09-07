@SmallSteps.module 'Views', (Views, App, Backbone, Marionette, $, _) ->

  Views.ItemView = Marionette.ItemView.extend

    closeModal: ->
      @$el.foundation('reveal', 'close')