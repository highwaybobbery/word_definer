require 'db_connection'
require 'model'
class Word < Model
  DB = DbConnection.connection
  TABLE_NAME = 'words'
  COLUMN_NAMES = %w(term)

  attr_accessor :term, :definitions
  attr_reader :id

  def initialize(term:, id: nil)
    @term = term
    @id = (id.nil?) ? nil : id.to_i
  end

  def self.sort()
    all.sort_by { |word| word.term }
  end

end #Word class
