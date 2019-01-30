require 'bookmark'
require 'pg'
require 'helper'

describe Bookmark do

  before(:each) do
    add_default_records
  end
  describe 'Bookmark.all' do
    it 'returns a list of bookmarks' do
      expect(Bookmark.all[0]).to be_an_instance_of(Bookmark)
      expect(Bookmark.all[0].url).to eq 'http://www.google.com'

      # include( { title: 'Google', url: 'http://www.google.com' } )
    end
  end
  describe 'Bookmark.create' do
    it 'creates a new bookmark' do
      url = 'www.website.com'
      title = 'Website'
      Bookmark.create(url, title)
      expect(Bookmark.all[-1].url).to eq 'www.website.com'
    end
  end
  describe 'Bookmark.new' do
    subject { described_class.new(1, 'www.google.com', 'Google') }
    it 'has an ID' do
      expect(subject.id).to eq 1
    end
    it 'has a URL' do
      expect(subject.url).to eq 'www.google.com'
    end
    it 'has a title' do
      expect(subject.title).to eq 'Google'
    end
  end
end
