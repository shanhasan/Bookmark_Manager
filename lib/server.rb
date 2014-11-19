require 'sinatra/base'
require 'data_mapper'

require_relative '../lib/link.rb'

env = ENV["RACK_ENV"] || "development"

DataMapper.setup(:default, "postgres://localhost/bookmark_manager_2_#{env}")

DataMapper.finalize

DataMapper.auto_upgrade!

class MyApp < Sinatra::Base

  set :views, Proc.new {File.join(root, "..", "views")} 

  get '/' do
    @links = Link.all
    erb :index
  end

  post '/' do
    url = param["url"]
    title = params["title"]
    Link.create(:url => url, :title => title)
    redirect to('/')
  end

    # start the server if ruby file executed directly
  run! if app_file == $0
end
 
