require 'pg'
require_relative 'database_connection'

class Bookmark
  attr_reader :id, :url, :title

  def initialize(id:, url:, title:)
    @id = id
    @url = url
    @title = title
  end

  def self.all
    result = DatabaseConnection.query('SELECT * FROM bookmarks')
    result.map do |bookmark|
      Bookmark.new(id: bookmark['id'], url: bookmark['url'], title: bookmark['title'])
    end
  end

  def self.create(url, title)
    result = DatabaseConnection.query("INSERT INTO bookmarks(url, title) VALUES('#{url}', '#{title}') RETURNING id, title, url ;")
    Bookmark.new(id: result[0]['id'],url: result[0]['url'],title: result[0]['title'])
  end

  def self.delete(id:)
    DatabaseConnection.query("DELETE FROM bookmarks WHERE id = #{id}")
  end

  def self.update(id:, title:, url:)
    DatabaseConnection.query("UPDATE bookmarks SET title = '#{title}', url = '#{url}' WHERE id = #{id}")
  end
end
