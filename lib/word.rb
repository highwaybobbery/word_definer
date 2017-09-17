class Word
  @@word_list = []
  attr_accessor :term, :definitions
  attr_reader :id

  def initialize(attributes)
    @term = attributes.fetch('term')
    @definitions = attributes.fetch('definitions', [])
    @id = @@word_list.length + 1
  end

  def self.all
    @@word_list
  end

  def add_word
    @@word_list.push(self)
  end

  def self.clear()
    @@word_list = []
  end

  def self.find(id)
    word_id = id.to_i()
    @@word_list.find { |word| word.id == word_id }
  end

  def self.sort()
    @@word_list.sort_by { |word| word.term }
  end

end #Word class
