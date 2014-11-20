class MyApp < Sinatra::Base

  get '/' do
      @links = Link.all
      erb :index
  end

end