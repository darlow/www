class Darlow < Sinatra::Base
  module ViewHelpers
    def partial(template, options={})
      erb "partials/_#{template}".to_sym, options.merge(:layout => false)
    end
  end

  helpers Herbie::Helpers
  helpers ViewHelpers
end
