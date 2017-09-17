require('rspec')
require('pry')
require('word')

describe("Word") do
  before() do
      Word.clear()
    end

  describe('#word') do
    it('saves a value in word') do
      word = Word.new({ "word" => "continent","definitions" => ["one of the seven main landmasses on the Earth", "", ""] })
      expect(word.word).to(eq("continent"))
    end
  end

  describe('#add_word') do
    it("adds words to the word list") do
      word1 = Word.new({ "word" => "continent","definitions" => ["one of the seven main landmasses on the Earth", "", ""] })
      word1.add_word()
      word2 = Word.new({"word" => "country", "definitions" => ["a nation with its own government on a particular piece of land", "", ""] })
      word2.add_word()
      expect(Word.all()).to(eq([word1, word2]))
    end
  end

  describe("#id") do
    it("increments an id by 1 each time a new item is added") do
      word1 = Word.new({ "word" => "continent","definitions" => ["one of the seven main landmasses on the Earth", "", ""] })
      word1.add_word()
      word2 = Word.new({"word" => "country", "definitions" => ["a nation with its own government on a particular piece of land", "", ""] })
      word2.add_word()
      expect(word1.id()).to(eq(1))
      expect(word2.id()).to(eq(2))
    end
  end

  describe('.find') do
    it('returns a word with a specific id') do
      word1 = Word.new({ "word" => "continent","definitions" => ["one of the seven main landmasses on the Earth", "", ""] })
      word1.add_word()
      expect(Word.find(1)).to(eq(word1))
    end
  end

  describe('.sort') do
    it('puts the list in alphabetical order') do
      word1 = Word.new({"word" => "country", "definitions" => ["a nation with its own government on a particular piece of land", "", ""]})
      word1.add_word()
      word2 = Word.new({"word" => "delta", "definitions" => ["a trangular soil deposit at the mouth of a river", "", ""]})
      word2.add_word()
      word3 = Word.new({"word" => "continent","definitions" => ["one of the seven main landmasses on the Earth", "", ""]})
      word3.add_word()
      expect(Word.sort()).to(eq([word3, word1, word2]))
    end
  end

end #Word class
