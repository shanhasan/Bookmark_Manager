require 'sinatra/base'

class MyApp < Sinatra::Base

  env = ENV["RACK_ENV"] || "development"

  DataMapper.setup(:default, "postgres://localhost/bookmark_manager_2_#{env}")

  require './lib/link'

  DataMapper.finalize

  DataMapper.auto_upgrade!

    # start the server if ruby file executed directly
  run! if app_file == $0
end
