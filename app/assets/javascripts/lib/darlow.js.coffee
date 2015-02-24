Darlow = (->
  module =
    name: 'Darlow'
    debug: true
    environment: null
    init: ->
      module.environment  = $('body').data('environment')
      module.debug        = module.environment is 'development'

      unless navigator.userAgent.indexOf('Macintosh') is -1
        $('body').addClass 'mac'

      unless navigator.userAgent.indexOf /(iPad|iPhone|iPod touch)/i is -1
        $('body').addClass 'ios'

      unless navigator.userAgent.indexOf('Firefox') is -1
        $('body').addClass 'firefox'

      if $.browser.msie
        $('body').addClass 'ie'
        if $.browser.version is '8.0'
          $('body').addClass 'ie8'

  $(document).ready(module.init)

  window.Darlow = module
  module
)()
