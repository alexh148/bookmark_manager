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
    end
  end
  describe 'Bookmark.create' do
    it 'creates a new bookmark' do
      url = 'www.website.com'
      title = 'Website'
      bookmark = Bookmark.create(url, title)
      persisted_data = persisted_data(id: bookmark.id)
      expect(bookmark).to be_a Bookmark
      expect(bookmark.id).to eq persisted_data.first[-1]
      expect(bookmark.url).to eq url
      expect(bookmark.title).to eq title
    end
  end
  describe 'Bookmark.new' do
    subject { described_class.new(id: 1, url: 'www.google.com', title: 'Google') }
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

  describe '#delete' do
    it 'deletes record from the database' do
      object = Bookmark.create('http://www.askjeeves.com', 'Ask Jeeves')
      Bookmark.delete(id: object.id)
      expect(Bookmark.all.last.id).not_to eq(object.id)
    end
  end

  describe '#update' do
    it 'updates record in the database' do
      object = Bookmark.create('http://www.askjeeves.com', 'Ask Jeeves')
      Bookmark.update(id: object.id, title: 'Disney', url: 'http://www.disney.com')
      expect(Bookmark.all.last.url).to eq 'http://www.disney.com'
    end
  end
end
