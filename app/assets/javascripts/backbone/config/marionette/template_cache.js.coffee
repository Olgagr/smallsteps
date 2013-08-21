do (Backbone, Marionette) ->

  Marionette.TemplateCache::loadTemplate = (templateId) ->
    templateId

  Marionette.TemplateCache::compileTemplate = (rawTemplate) ->
    JST[rawTemplate]

