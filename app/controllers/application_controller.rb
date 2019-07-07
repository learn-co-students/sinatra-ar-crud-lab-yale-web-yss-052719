
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  # INDEX
  get '/articles' do
    @articles = Article.all
    erb :index
  end

  # NEW
  get '/articles/new' do
    @article = Article.new
    erb :new
  end

  # CREATE
  post '/articles' do
    @article = Article.create(article_params)
    redirect_to '/articles'
  end

  # SHOW
  get '/articles/:id' do
    find_art
    erb :show
  end

  # EDIT

  get '/articles/:id/edit' do
    find_art
    erb :edit
  end

  # UPDATE
  patch '/articles/:id' do
    find_art
    @article.update(article_params)
  end

  # DELETE
  delete '/articles/:id' do
    find_art
    @article.delete
  end 


  

  private

  def find_art
    @article = Article.find(params[:id])
  end


  def article_params
    params.require(:article).permit(:title, :content)
  end
end
