require './lib/db_connection'
require './lib/model'

class Word < Model
  DB = DbConnection.connection
  TABLE_NAME = 'words'
  COLUMN_NAMES = %w(term)

  attr_accessor :term
  attr_reader :id

  def initialize(term:, id: nil)
    @term = term
    @id = (id.nil?) ? nil : id.to_i
  end

  def self.sort()
    all.sort_by { |word| word.term }
  end

  def definitions
    Definition.where(word_id: id)
  end

end #Word class
