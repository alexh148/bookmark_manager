require 'bookmark'

describe Bookmark do
  it 'returns a list of bookmarks' do
    expect(subject.all).to include(['Wikipedia', 'https://en.wikipedia.org/wiki/Main_Page'])
  end
end
