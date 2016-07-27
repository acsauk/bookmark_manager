require 'sinatra/base'
require_relative 'models/link'

ENV['RACK_ENV'] ||= 'development'

class BookmarkManager < Sinatra::Base

  get '/links' do
    @links = Link.all
    erb :'links/index'
  end

  get '/links/new' do
    erb :'links/new'
  end

  post '/links' do
    title = params[:title]
    url = params[:url]
    Link.create(title: title, url: url)
    redirect '/links'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
