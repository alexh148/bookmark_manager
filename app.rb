require 'sinatra/base'
require_relative './lib/bookmark'

class BookmarkApp < Sinatra::Base

  enable :method_override

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
