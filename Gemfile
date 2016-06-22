source 'http://rubygems.org'
ruby '2.2.3'

gem 'rack'
gem 'sinatra',                    github: 'sinatra/sinatra'
gem 'herbie',                     '~> 0.4.1'
gem 'sinatra-asset-pipeline',     require: 'sinatra/asset_pipeline', github: 'kapowaz/sinatra-asset-pipeline', branch: 'master'
gem 'sass',                       '~> 3.3'
gem 'compass',                    '~> 1.0.0'
gem 'compass-excess',             '~> 0.5.2', github: 'kapowaz/compass-excess', branch: 'master'
gem 'coffee-script'
gem 'yui-compressor'
gem 'uglifier',                   '~> 2.4.0'
gem 'handlebars_assets'

group :development do
  gem 'rb-fsevent'
  gem 'guard-livereload'
  gem 'rack-livereload'
  gem 'pry'
end

group :production do
  gem 'unicorn'
end
