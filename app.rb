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

  get '/bookmark/new' do
    erb :add_bookmark
  end

  post '/bookmarks' do
    Bookmark.create(params[:URL], params[:Title])
    redirect '/bookmarks'
  end

end
