class Word
  @@word_list = []
  attr_accessor :word
  attr_reader :id

  def initialize(attributes)
    @word = attributes.fetch("word")
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
end
