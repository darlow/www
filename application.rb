require 'bundler'
Bundler.require

require 'sinatra/asset_pipeline'

class Darlow < Sinatra::Base
  set :views,                 File.dirname(__FILE__) + '/app/views'
  set :public_folder,         File.dirname(__FILE__) + '/public'
  set :root_domain,           'darlow.eu'
  set :app_root,              File.expand_path(File.dirname(__FILE__))
  # set :assets_host,           'cdn.darlow.eu'
  set :assets_prefix,         %w(app/assets)
  set :assets_precompile,     %w(templates.js vendor.js application.js application.css *.ico *.icns *.png *.jpg *.svg *.eot *.ttf *.woff)
  set :assets_protocol,       :http
  set :assets_css_compressor, :sass
  set :assets_js_compressor,  :uglify

  APP_ROOT = settings.app_root

  register Sinatra::AssetPipeline
  sprockets.append_path HandlebarsAssets.path

  before do
    redirect "http://staging.#{settings.root_domain}", 301 if request.host =~ /^darlow-staging.herokuapp.com$/
    redirect "http://www.#{settings.root_domain}", 301 if request.host =~ /^darlow-production.herokuapp.com$/
    redirect request.url.sub('http://', 'http://www.'), 301 unless request.host =~ /^www.darlow.dev$|^www.#{settings.root_domain}$|^staging.#{settings.root_domain}$/
  end
end

Dir[File.join(File.dirname(__FILE__), 'app/**/*.rb')].sort.each { |f| require f }
