require 'rubygems'
require 'sinatra/base'
require 'herbie'

class Darlow < Sinatra::Base
  set :views,                   File.dirname(__FILE__) + '/app/views'
  set :public,                  File.dirname(__FILE__) + '/public'
  
  before do
    redirect request.url.sub('http://', 'http://www.'), 301 unless request.host =~ /^www/
  end
end

Dir[File.join(File.dirname(__FILE__), 'app/**/*.rb')].sort.each { |f| require f }