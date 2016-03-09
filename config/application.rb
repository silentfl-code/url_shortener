require 'sinatra'
require 'sinatra/base'

require 'rubygems'

require 'uri'
require 'pathname'

require 'pg'
require 'active_record'
require 'slim'
require 'logger'

APP_ROOT = Pathname.new(File.expand_path('../../', __FILE__))
APP_NAME = APP_ROOT.basename.to_s

require APP_ROOT.join('config', 'database')

Dir[APP_ROOT.join('app', 'helpers', '*.rb')].each { |file| require file }
Dir[APP_ROOT.join('app', 'controllers', '*.rb')].each { |file| require file }

class App
  configure do
    # убраны гласные, чтобы short url не был словом
    # убраны похожие буквы i~l
    set :abc, "123456789bcdfghjkmnpqrstvwxyzBCDFGHJKLMNPQRSTVWXYZ"
    set :domain, "http://localhost:9292/"

    set :app_file, __FILE__
    set :root, Pathname.new(File.expand_path('../../', __FILE__)).to_s
    set :views, File.join(root, "app", "views")
  end
end
