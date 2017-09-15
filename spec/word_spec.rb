require('rspec')
require('pry')
require('word')

describe("Word") do
  before() do
      Word.clear()
    end

  describe('#add_word') do
    it("adds a word to the word list") do
      word = Word.new({"word" => "continent"})
      word.add_word()
      expect(Word.all()).to(eq([word]))
    end
  end

  describe("#id") do
    it("increments an id by 1 each time a new item is added") do
      word = Word.new({"word" => "continent"})
      word.add_word()
      expect(word.id()).to(eq(1))
    end
  end

end #Word class
