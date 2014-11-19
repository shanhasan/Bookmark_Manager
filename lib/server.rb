require 'sinatra/base'
require 'data_mapper'

require_relative '../lib/link.rb'
require_relative '../lib/tag.rb'
require_relative '../lib/user.rb'

env = ENV["RACK_ENV"] || "development"

DataMapper.setup(:default, "postgres://localhost/bookmark_manager_2_#{env}")

DataMapper.finalize

DataMapper.auto_upgrade!

class MyApp < Sinatra::Base

  set :views, Proc.new{File.join(root, "..", "views")} 

  get '/' do
    @links = Link.all
    erb :index
  end

  post '/links' do
    url = params["url"]
    title = params["title"]
    tags = params["tags"].split(" ").map do |tag|
      Tag.first_or_create(:text => tag)
    end
    Link.create(:url => url, :title => title, :tags => tags)
    redirect to('/')
  end

  get '/tags/:text' do
    tag = Tag.first(:text => params[:text])
    @links = tag ? tag.links : []
    erb :index
  end

  get '/users/new' do
    erb :"users/new"
  end

  post '/users' do
    User.create(:email => params[:email],
                :password => params[:password])
    redirect to('/')
  end




    # start the server if ruby file executed directly
  run! if app_file == $0
end
 
