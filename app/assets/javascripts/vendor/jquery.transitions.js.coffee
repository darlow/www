$             = jQuery
$.transitions =
  events:
    end: 'webkitTransitionEnd mozTransitionEnd msTransitionEnd oTransitionEnd transitionEnd transitionend'
  supported: ->
    body = document.body or document.documentElement
    style = body.style
    property = 'transition'

    if typeof style[property] is 'string'
      return true

    vendors = ['Moz', 'webkit', 'Webkit', 'Khtml', 'O', 'ms']
    jQuery.each vendors, (i, prefix) ->
      if typeof "#{style[prefix]}Transition" is 'string'
        return true
    false

$.fn.extend
  onTransitionEnd: (callback) ->
    if $.transitions.supported()
      $(this).on $.transitions.events.end, ->
        $(this).unbind $.transitions.events.end
        if typeof callback is "function"
          callback()
    else
      if typeof callback is "function"
        callback()
