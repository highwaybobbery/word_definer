require 'db_connection'
class Model
  def self.all
    DB.select("SELECT * from #{self::TABLE_NAME};").map do |row|
      self.new(row)
    end
  end

  def self.find(id)
    result = DB.select("select * from #{self::TABLE_NAME} where id = #{id};")
    self.new(result[0])
  end

  def save
    values = self.class::COLUMN_NAMES.map { |column_name| public_send column_name }.join("', '")
    result = DB.exec("INSERT INTO #{self.class::TABLE_NAME} (#{self.class::COLUMN_NAMES.join(',')}) VALUES ('#{values}') RETURNING id;")
    @id ||= result[0]['id'].to_i
    self
  end
end

