require 'sinatra/base'
require_relative './lib/database_connection_setup'
require_relative './lib/bookmark'
require 'uri'
require 'sinatra/flash'

class BookmarkApp < Sinatra::Base

  enable :method_override, :sessions
  register Sinatra::Flash

  get '/' do
    erb :index
  end

  get '/bookmarks' do
    @bookmarks = Bookmark.all
    erb :bookmarks
  end

  get '/bookmarks/new' do
    erb :add_bookmark
  end

  post '/bookmarks' do
    if params[:URL] =~ URI::regexp
      Bookmark.create(params[:URL], params[:Title])
      redirect '/bookmarks'
    else
      flash[:alert] = "Invalid URL entered. Please try again"
      redirect '/bookmarks/new'
    end
  end

  get '/bookmarks/delete' do
    @bookmarks = Bookmark.all
    erb :delete_bookmark
  end

  delete '/bookmarks' do
    Bookmark.delete(id: params[:record])
    redirect '/bookmarks'
  end

  get '/bookmarks/update_list' do
    @bookmarks = Bookmark.all
    erb :update_list
  end

  post '/bookmarks/update_bookmark' do
    @bookmark = Bookmark.all.find { |bookmark| bookmark.id == params[:record] }
    erb :update_bookmark
  end

  patch '/bookmarks' do
    Bookmark.update(id: params[:id], title: params[:Title], url: params[:URL])
    redirect '/bookmarks'
  end
end
