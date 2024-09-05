require 'sqlite3'

class SQLiteStorageStrategy
  def initialize(db_name)
    @db = SQLite3::Database.new(db_name)
    @db.results_as_hash = true
  end

  def save(data, table_name)
    data.delete(:id)
    data.delete(:entity_type)
    columns = data.keys.join(', ')
    values = data.values.map { |value| "'#{value}'" }.join(', ')
    @db.execute("INSERT INTO #{table_name} (#{columns}) VALUES (#{values})")
  end

  def load_all(table_name)
    @db.execute("SELECT * FROM #{table_name}")
  end

  def create_table(table_name, columns)
    columns_sql = columns.map { |column, type| "#{column} #{type}" }.join(', ')
    @db.execute("CREATE TABLE IF NOT EXISTS #{table_name} (#{columns_sql})")
  end
end
