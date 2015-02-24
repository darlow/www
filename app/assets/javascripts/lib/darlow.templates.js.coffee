Darlow.templates = ((Darlow) ->
  module =
    name: 'templates'

    # Render a named template with the supplied data context
    # @param {String} name Name of template to render
    # @param {Object} context Object with keys / values to interpolate into template
    # @returns {DOMElement} HTML of rendered template
    # e.g. output = Darlow.templates.render 'menu', { ... }
    render: (name, context) ->
      jQuery HandlebarsTemplates['darlow/' + name](context)
  module
)(Darlow)
