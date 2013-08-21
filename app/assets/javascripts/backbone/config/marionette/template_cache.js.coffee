do (Backbone, Marionette) ->

  Marionette.TemplateCache::compileTemplate = (rawTemplate) ->
    JST[rawTemplate]