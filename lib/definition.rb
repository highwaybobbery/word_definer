require './lib/db_connection'
require './lib/model'

class Definition < Model
  TABLE_NAME = 'definitions'
  COLUMN_NAMES = %w(text word_id)

  attr_accessor :text, :word_id
  attr_reader :id

  def initialize(text:, word_id:, id: nil)
    @text = text
    @word_id = word_id.to_i
    @id = (id.nil?) ? nil : id.to_i
  end

end #Word class
