
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  #read articles
  get '/articles' do
    @articles = Article.all
    erb :index
  end

  #create article
  post '/articles' do
    @article = Article.create(params)
    redirect to "/articles/#{@article.id}"
  end

  #new form
  get '/articles/new' do
    erb :new
  end

  #read article by id
  get '/articles/:id' do
    @article = Article.find(params[:id])
    erb :show
  end
     
  #* Get edit Article form
  get '/articles/:id/edit' do
    @article = Article.find(params[:id])
    erb :edit
  end

  #* Update Article
  patch '/articles/:id' do
        @article = Article.find(params[:id])
        @article.update(params[:article])
        redirect to "/articles/#{@article.id}"
  end

  #* delete Article
  delete '/articles/:id' do
      Article.destroy(params[:id])
      redirect to "/articles"
  end

end
