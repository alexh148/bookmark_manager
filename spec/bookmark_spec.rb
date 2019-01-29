require 'bookmark'
require 'pg'
require 'helper'

describe Bookmark do

  before(:each) do
    truncate_test_db
    add_default_records
  end

  it 'returns a list of bookmarks' do
    expect(Bookmark.all).to include('http://www.google.com')
  end

  it 'creates a new bookmark' do
    url = 'www.website.com'
    Bookmark.create(url)
    expect(Bookmark.all).to include('www.website.com')
  end

end
