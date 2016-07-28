require 'sinatra/base'
require_relative "models/data_mapper_setup"
ENV['RACK_ENV'] ||= 'development'


class BookmarkManager < Sinatra::Base
  enable :sessions
  set :sessions_secret, 'super secret'

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

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

  get '/sign-up' do
    erb :'links/sign-up'
  end

  post '/sign-up' do
    user = User.create(email: params[:email], password: params[:password])
    session[:user_id] = user.id
    redirect '/links'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
