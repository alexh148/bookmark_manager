require 'sinatra/base'
require_relative './lib/bookmark'

class BookmarkApp < Sinatra::Base

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
    Bookmark.create(params[:URL], params[:Title])
    redirect '/bookmarks'
  end

  get '/bookmarks/delete' do
    @bookmarks = Bookmark.all
    erb :delete_bookmark
  end

  post '/bookmarks/delete' do
    Bookmark.delete(id: params[:record])
    redirect '/bookmarks'
  end
end
