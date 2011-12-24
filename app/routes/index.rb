# encoding: utf-8
class Darlow < Sinatra::Base
  before do
    @page = { :title => "Darlow Technology" }
  end
  
  get "/" do
    erb :index
  end
end