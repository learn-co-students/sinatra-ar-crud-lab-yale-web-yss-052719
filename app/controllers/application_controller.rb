
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
  
  end

  get '/articles' do
    @articles = Article.all
    erb :index
  end

  get '/articles/new' do
    erb :new
  end

  
  get '/articles/:id' do
      @article = Article.find_by(id: params[:id])
      erb :show
  end

  post '/articles' do 
    Article.create(title: params[:title], content: params[:content])
    @article = Article.find_by(title: params[:title], content: params[:content])
    redirect to("/articles/#{@article.id}")
  end

  get '/articles/new' do
    erb :new
  end

  
  get '/articles/:id/edit' do
    @article = Article.find_by(id: params[:id])
    erb :edit
  end

  patch '/articles/:id' do 
    @article = Article.find_by(id: params[:id])
    @article.update(title: params[:title], content: params[:content])
    #binding.pry
    redirect to("/articles/#{@article.id}")
  end

  delete '/articles/:id' do
    @article = Article.find_by(id: params[:id])
    @article.delete
    redirect '/articles'
  end



end
