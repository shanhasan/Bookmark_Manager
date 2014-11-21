require 'sinatra/base'
require 'data_mapper'
require 'rack-flash'
require 'sinatra/partial'

require_relative '../models/link.rb'
require_relative '../models/tag.rb'
require_relative '../models/user.rb'

require_relative 'helpers/application'
require_relative 'data_mapper_setup'

require_relative 'controllers/application'
require_relative 'controllers/links'
require_relative 'controllers/sessions'
require_relative 'controllers/tags'
require_relative 'controllers/users'

class MyApp < Sinatra::Base

  register Sinatra::Partial

  enable :sessions
  set :session_secret, 'super secret'
  use Rack::Flash
  set :methodoverride, true
  set :partial_template_engine, :erb

  set :views, Proc.new{File.join(root, "..", "views")} 

  helpers ApplicationHelpers

  run! if app_file == $0
end
 

