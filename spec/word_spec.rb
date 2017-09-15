require('rspec')
require('pry')
require('word')

describe("Word") do
  before() do
      Word.clear()
    end

  describe('#word') do
    it('saves a value in word') do
      word = Word.new({"word" => "continent"})
      expect(word.word).to(eq("continent"))
    end
  end

  describe('#add_word') do
    it("adds words to the word list") do
      word1 = Word.new({"word" => "continent"})
      word1.add_word()
      word2 = Word.new({"word" => "country"})
      word2.add_word()
      expect(Word.all()).to(eq([word1, word2]))
    end
  end

  describe("#id") do
    it("increments an id by 1 each time a new item is added") do
      word1 = Word.new({"word" => "continent"})
      word1.add_word()
      word2 = Word.new({"word" => "country"})
      word2.add_word()
      expect(word1.id()).to(eq(1))
      expect(word2.id()).to(eq(2))
    end
  end

end #Word class
