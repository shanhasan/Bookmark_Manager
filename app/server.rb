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

#   get '/' do
#     @links = Link.all
#     erb :index
#   end

#   post '/links' do
#     url = params["url"]
#     title = params["title"]
#     tags = params["tags"].split(" ").map{|tag| Tag.first_or_create(:text => tag)}
#     Link.create(:url => url, :title => title, :tags => tags)
#     redirect to('/')
#   end

#   get '/tags/:text' do
#     tag = Tag.first(:text => params[:text])
#     @links = tag ? tag.links : []
#     erb :index
#   end

#   get '/users/new' do
#     @user = User.new
#     erb :"users/new"
#   end

#   post '/users' do
#    @user = User.create(:email => params[:email],
#                 :password => params[:password],
#                 :password_confirmation => params[:password_confirmation])
#     if @user.save
#       session[:user_id] = @user.id
#       redirect to('/')
#     else
#       flash.now[:errors] = @user.errors.full_messages
#       erb :"users/new"
#     end
#   end

#   get '/sessions/new' do
#     erb :"sessions/new"
#   end

#   post '/sessions' do
#   email, password = params[:email], params[:password]
#   user = User.authenticate(email, password)
#   if user
#     session[:user_id] = user.id
#     redirect to('/')
#   else
#     flash[:errors] = ["The email or password is incorrect"]
#     erb :"sessions/new"
#   end
# end

#   delete '/sessions' do
#     flash[:notice] = "Good bye!"
#     session[:user_id] = nil
#     redirect to('/')
# end

    # start the server if ruby file executed directly
  
  run! if app_file == $0
end
 

