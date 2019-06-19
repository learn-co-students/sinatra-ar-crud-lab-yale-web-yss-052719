
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
  end

  get '/articles/new' do
    erb :new
   end

  post '/articles/:id' do
    @articles = Article.create(params)
    redirect to("/articles/#{@articles.id}")
  end

   get '/articles' do
    @articles = Article.all
    erb :index
   end

   get 'articles/:id' do
      @articles = Active.find(params[:id])
      erb :show
   end

   get 'articles/:id/edit' do
      @articles = Article.find(params[:id])
      erb :edit
   end

   patch 'articles/:id' do
      @articles = Article.update(title: params[:title], content: params[:content])
      @articles.save
      redirect to("/articles/#{@articles.id}")
   end

   delete 'articles/:id' do
      @articles = Article.destroy(params[:id])
      redirect to("/index")
   end



end
