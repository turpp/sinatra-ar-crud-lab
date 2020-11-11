
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    'whatever'
  end

  get '/articles' do
    @articles=Article.all
    erb :index
  end

  post '/articles' do
   @article=Article.create(params)
   redirect "/articles/#{Article.last.id}"
    erb :show
  end

  get '/articles/new' do
    erb :new
  end

  get '/articles/:id/edit' do
    
    @article=Article.find(id=params[:id])
 
    erb :edit
  end


  get '/articles/:id' do
    @id=params[:id]
    @article=Article.find(params[:id])
    erb :show
  end

  patch '/articles/:id' do
   
    @article=Article.find(id=params[:id])
    @article.update(title: params[:title], content: params[:content])
    @article.save
    
   erb :show
  end

  delete '/articles/:id' do
    @article=Article.find(id=params[:id])
    @article.destroy
    redirect '/articles'
  end

end
