do (Backbone, Marionette) ->

  Marionette.TemplateCache::loadTemplate = (templateId) ->
    template = JST[templateId]
    throw new Error("Could not find template: '" + templateId + "'", "NoTemplateError") unless template
    template

  Marionette.TemplateCache::compileTemplate = (rawTemplate) ->
    JST[rawTemplate]

