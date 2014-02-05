window.gc = {} # Define the variable where some stuff will go (such as templates)
window.GC = {} # Define the GC namespace where all the Javascript will be located

# Setup the way marionette reads templates from Handlebars
# This is required because otherwise, marionette will expect all its
# templates to be inlined.
Backbone.Marionette.Renderer.render = (template, data) ->
  return unless template

  if typeof template == 'function'
    templateFunc = template
  else
    templateFunc = Backbone.Marionette.TemplateCache.get(template)
  templateFunc(data)

Backbone.Marionette.TemplateCache.prototype.loadTemplate = (templateId) ->
  if HandlebarsTemplates[templateId]
    return HandlebarsTemplates[templateId]
  else
    throw "Template '" + templateId + "' not found!"

Backbone.Marionette.TemplateCache.prototype.compileTemplate = (rawTemplate) ->
  rawTemplate
