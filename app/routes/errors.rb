# encoding: utf-8
class Darlow < Sinatra::Base
  error 403 do
    @page[:title] = "Forbidden"
    erb :'errors/forbidden'
  end

  not_found do
    @page[:title] = "Not Found"
    erb :'errors/not_found'
  end
end
