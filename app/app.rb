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
    @link=Link.create(title: title, url: url)
    params[:name].split(', ').each do |tag|
      @tag = Tag.create(name: tag)
      @link.tags << @tag
      @link.save
    end
    redirect '/links'
  end

  get '/tags/:tag' do
    @links = Link.all(:'tags.name' => params['tag'])
    erb :'links/index'
  end


  # start the server if ruby file executed directly
  run! if app_file == $0
end
