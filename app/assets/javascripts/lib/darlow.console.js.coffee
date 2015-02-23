Darlow.console = ((Darlow) ->
  module =
    name: 'console'

    # Generate a formatted timestamp string
    timestamp: ->
      time = new Date
      components = (Darlow.utilities.number.pad num, 2 for num in [
        time.getHours()
        time.getMinutes()
        time.getSeconds()
      ])
      "[#{components.join ':'}.#{Darlow.utilities.number.pad time.getMilliseconds(), 3}]"

    # Find the name of the module and method for a calling method within the global Darlow namespace
    find_caller: (fn) ->
      found = module: null, method: null

      for module of Darlow
        if typeof Darlow[module] is 'object'
          for property of Darlow[module]
            if typeof Darlow[module][property] is 'function' && Darlow[module][property] is fn
              found = module: module, method: property
      found

    # Format arguments to console output methods
    format_args: (args, module, method) ->
      args = Array.prototype.slice.call args
      args.splice args.length, 0, ')' if args.length > 0
      args.splice 0, 0, "#{Darlow.console.timestamp()} Darlow.#{if module? then module + '.' else ''}#{(method || 'anonymous')}(#{if args.length is 0 then ')' else ''}"

      if console.log.apply?
        args
      else
        args.join " "

    # Generate formatted console log output
    log: ->
      caller = Darlow.console.find_caller arguments.callee.caller

      if console? and Darlow.debug is true
        if console.log.apply?
          console.log.apply console, Darlow.console.format_args(arguments, caller.module, caller.method)
        else
          console.log Darlow.console.format_args(arguments, caller.module, caller.method)

    # Generate formatted console error output
    error: ->
      caller = Darlow.console.find_caller arguments.callee.caller

      if console? and Darlow.debug is true
        if console.error.apply?
          console.error.apply console, Darlow.console.format_args(arguments, caller.module, caller.method)
        else
          console.error Darlow.console.format_args(arguments, caller.module, caller.method)

    # Generates formatted console group output for modules this function is included within
    group: ->
      caller = Darlow.console.find_caller arguments.callee.caller

      if console? and Darlow.debug is true
        if console.group.apply?
          console.group.apply console, Darlow.console.format_args(arguments, caller.module, caller.method)
        else
          console.group Darlow.console.format_args(arguments, caller.module, caller.method)

    # End formatted console group output
    groupEnd: ->
      if console? and Darlow.debug is true
        console.groupEnd()
  module
)(Darlow)
