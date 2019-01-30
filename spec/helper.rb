def truncate_test_db
  connection = PG.connect(dbname: 'bookmark_manager_test')
  connection.exec('TRUNCATE TABLE bookmarks')
end

def add_default_records
  connection = PG.connect(dbname: 'bookmark_manager_test')
  connection.exec("INSERT INTO bookmarks(url,title) VALUES('http://www.google.com','Google'), ('http://www.twitter.com','Twitter')")
end

def persisted_data(id:)
  connection = PG.connect(dbname: 'bookmark_manager_test')
  result = connection.query("SELECT * FROM bookmarks WHERE id = #{id} ;")
  result.first
end
