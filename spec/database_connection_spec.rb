require 'database_connection'
require 'pg'

describe DatabaseConnection do
  describe '#setup' do
    it 'Sets up the database connection' do
      expect(PG).to receive(:connect).with(dbname: 'bookmark_manager_test')
      DatabaseConnection.setup('bookmark_manager_test')
    end
  end

  describe '#connection' do
    it 'Has a persistent connection' do
      connection = DatabaseConnection.setup('bookmark_manager_test')
      expect(DatabaseConnection.connection).to eq connection
    end
  end

  describe '#query' do
    it 'Can execute an SQL query passed as an argument' do
      query = 'SELECT * FROM bookmarks'
      DatabaseConnection.setup('bookmark_manager_test')
      expect(DatabaseConnection.connection).to receive(:exec).with(query)
      DatabaseConnection.query(query)
    end
  end


end
