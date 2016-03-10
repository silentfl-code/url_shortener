require 'sinatra'
require 'sinatra/base'
require 'sinatra/logger'

require 'rubygems'

require 'uri'
require 'pathname'

require 'pg'
require 'active_record'
require 'slim'

APP_ROOT = Pathname.new(File.expand_path('../../', __FILE__))
APP_NAME = APP_ROOT.basename.to_s

require APP_ROOT.join('config', 'database')

Dir[APP_ROOT.join('app', 'helpers', '*.rb')].each { |file| require file }
Dir[APP_ROOT.join('app', 'controllers', '*.rb')].each { |file| require file }

class App
  configure do
    set :domain, "http://localhost:9292/"

    set :app_file, __FILE__
    set :root, Pathname.new(File.expand_path('../../', __FILE__)).to_s
    set :views, File.join(root, "app", "views")

    #enable :logging
    #log = File.new("#{settings.root}/log/#{settings.environment}.log", 'a+')
    #log.sync = true
    #use Rack::CommonLogger, log

    set :logger_log_file, lambda { "#{settings.root}/log/#{settings.environment}.log" }
  end
end
