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
end
