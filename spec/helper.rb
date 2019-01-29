def truncate_test_db
  connection = PG.connect(dbname: 'bookmark_manager_test')
  connection.exec('TRUNCATE TABLE bookmarks')
end

def add_default_records
  connection = PG.connect(dbname: 'bookmark_manager_test')
  connection.exec("INSERT INTO bookmarks(url) VALUES('http://www.google.com'), ('http://www.twitter.com')")
end
