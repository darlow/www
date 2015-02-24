# encoding: utf-8
class Darlow < Sinatra::Base
  before do
    @page = { title: "Darlow Technology" }
  end

  get "/" do
    @page[:keywords] = [
      'html',
      'javascript',
      'css',
      'scss',
      'coffeescript',
      'ruby',
      'sinatra',
      'sprockets',
      'responsive web design'
    ]
    erb :'pages/home'
  end
end
