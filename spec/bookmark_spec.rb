require 'bookmark'
require 'pg'
require 'helper'

describe Bookmark do

  before(:each) do
    add_default_records
  end
  describe 'Bookmark.all' do
    it 'returns a list of bookmarks' do
      expect(Bookmark.all).to include( {title: 'Google', url: 'http://www.google.com' } )
    end
  end
  describe 'Bookmark.create' do
    it 'creates a new bookmark' do
      url = 'www.website.com'
      title = 'Website'
      Bookmark.create(url, title)
      expect(Bookmark.all).to include({title: 'Website', url: 'www.website.com'})
    end
  end
end
