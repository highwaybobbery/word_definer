require 'spec_helper'
require 'definition'

describe Definition do

  describe('#initialize') do
    it 'sets the text and word_id' do
      definition = Definition.new(text: 'is big', word_id: '1')
      expect(definition.text).to eq('is big')
      expect(definition.word_id).to eq(1)
    end

    it 'sets id if present' do
      definition = Definition.new(text: 'is big', word_id: '1', id: '2')
      expect(definition.text).to eq('is big')
      expect(definition.word_id).to eq(1)
      expect(definition.id).to eq(2)
    end
  end

  describe '#save' do
    it 'saves the definition in the DB' do
      definition = Definition.new(text: 'is big', word_id: '1')
      definition.save
      expect(Definition.all.first.text).to eq('is big')
      expect(Definition.all.first.id).not_to be(nil)
    end
  end

  describe("#id") do
    it("increments id by 1 each time a new word is saved") do
      definition1 = Definition.new(text: 'is big', word_id: '1').save
      definition2 = Definition.new(text: 'is big', word_id: '1').save
      expect(definition2.id).to eq(definition1.id + 1)
    end
  end

end #Word class

