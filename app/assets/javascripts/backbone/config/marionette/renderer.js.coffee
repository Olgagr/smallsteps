do (Backbone) ->

  getTemplate = (url) ->
    roots = ['backbone/apps/']

    for root in roots
      return Marionette.TemplateCache.get("#{root}#{url}")


  Backbone.Marionette.Renderer.render = (url, data) ->
    renderedTemplate = getTemplate url
    throw new Error("Can't find template!") unless renderedTemplate
    renderedTemplate(data)


