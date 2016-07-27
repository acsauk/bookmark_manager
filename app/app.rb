require 'sinatra/base'
require_relative "models/data_mapper_setup"
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
    @tag = Tag.create(name: params[:name])
    @link=Link.create(title: title, url: url)
    @link.tags << @tag
    @link.save
    redirect '/links'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
