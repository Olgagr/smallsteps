do (Backbone, Marionette) ->

  Marionette.Region.Modal = Marionette.Region.extend

    onShow: (view) ->
      @$el.foundation 'reveal', 'open'
      @$el.bind 'close', => @close()
