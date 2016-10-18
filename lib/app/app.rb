require 'sinatra/base'

ENV["RACK_ENV"] ||= "development"

require './lib/app/models/link'

class BookmarkManager < Sinatra::Base
  get '/' do
    redirect '/links/new'
  end

  get '/links' do
    @links = Link.all
    erb :'links/index'
  end

  get '/links/new' do
    erb :'links/new_link'
  end

  post '/links' do
    Link.create(url: params[:url], title: params[:title])
    redirect '/links'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
