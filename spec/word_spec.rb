require 'spec_helper'
require 'word'

describe Word do
  describe('.find') do
    it('returns the word with a specific id') do
      word1 = Word.new(term: 'continent').save
      found_word = Word.find(word1.id)
      expect(found_word.term).to eq(word1.term)
      expect(found_word.id).to eq(word1.id)
    end
  end

  describe('.all') do
    it('returns all the words in the order they were created') do
      Word.new(term: 'country').save
      Word.new(term: 'delta').save
      Word.new(term: 'continent').save
      expect(Word.all().map(&:term)).to eq(['country', 'delta', 'continent'])
    end
  end

  describe('.sort') do
    it('returns all the  words in alphabetical order') do
      Word.new(term: 'country').save
      Word.new(term: 'delta').save
      Word.new(term: 'continent').save
      expect(Word.sort().map(&:term)).to eq(['continent', 'country', 'delta'])
    end
  end

  describe('#initialize') do
    it 'sets the term' do
      word = Word.new(term: 'continent')
      expect(word.term).to eq('continent')
    end
  end

  describe '#save' do
    it 'saves the word in the DB' do
      Word.new(term: 'continent').save
      expect(Word.all.first.term).to eq('continent')
      expect(Word.all.first.id).not_to be(nil)
    end
  end

  describe("#id") do
    it("increments id by 1 each time a new word is saved") do
      word1 = Word.new(term: 'continent').save
      word2 = Word.new(term: 'country').save
      expect(word2.id).to eq(word1.id + 1)
    end
  end

  describe("definitions") do
    it('returns the definitions from the database') do
      word = Word.new(term: 'continent').save
      definition1 = Definition.new(text: 'is big', word_id: word.id).save
      definition2 = Definition.new(text: 'real big', word_id: word.id).save
      expect(word.definitions.map(&:text)).to eq(['is big', 'real big'])
    end
  end
end
