require 'db_connection'
include 'model'
class Definition
  DB = DbConnection.connection
  TABLE_NAME = 'definition'

  attr_accessor :term, :definitions
  attr_reader :id

  def initialize(term:, id: nil)
    @term = term
    @id = id
  end

  def save
    result = DB.exec("INSERT INTO words (term) VALUES ('#{@term}') returning id;")
    @id ||= result[0]['id'].to_i
    self
  end

  def self.all
    DB.exec("SELECT * from words;").map do |row|
      Word.new(term: row['term'], id: row['id'].to_i)
    end
  end

  def self.find(id)
    result = DB.exec("select * from words where id = #{id};")
    Word.new(term: result[0]['term'], id: result[0]['id'].to_i)
  end

  def self.sort()
    all.sort_by { |word| word.term }
  end

end #Word class
end
