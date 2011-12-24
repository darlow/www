require 'rubygems'
require 'sinatra/base'
require 'herbie'
require 'data_mapper'
require 'extlib'

class Darlow < Sinatra::Base
    
  set :views,                   File.dirname(__FILE__) + '/app/views'
  set :public,                  File.dirname(__FILE__) + '/public'
  
  configure :development do
    DataMapper.setup :default, YAML.load(File.new("config/database.yml"))[:development]
  end
  
  configure :production do
    DataMapper.setup(:default, ENV['DATABASE_URL'])
  end
  
end

Dir[File.join(File.dirname(__FILE__), 'app/**/*.rb')].sort.each { |f| require f }

DataMapper.finalize
DataMapper.auto_upgrade!