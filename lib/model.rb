require './lib/db_connection'
class Model
  DB = DbConnection.connection
  def self.all
    DB.select("SELECT * from #{self::TABLE_NAME};").map do |row|
      self.new(row)
    end
  end

  def self.find(id)
    result = DB.select("select * from #{self::TABLE_NAME} where id = #{id};")
    self.new(result[0])
  end

  def self.where(conditions)
    clause = conditions.map do |field, condition|
      "#{field} = #{condition}"
    end.join(' and ')
    query = "select * from #{self::TABLE_NAME} where (#{clause});"
    DB.select(query).map do |row|
      self.new(row)
    end
  end

  def save
    values = self.class::COLUMN_NAMES.map { |column_name| public_send column_name }.join("', '")
    query = "INSERT INTO #{self.class::TABLE_NAME} (#{self.class::COLUMN_NAMES.join(',')}) VALUES ('#{values}') RETURNING id;"
    result = DB.exec(query)
    @id ||= result[0]['id'].to_i
    self
  end
end

