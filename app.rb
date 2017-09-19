require 'sinatra'
require './lib/word'
require './lib/definition'
require 'pg'

get('/') do
  @word_list = Word.all()
  erb(:list)
end

get('/word/:id') do
  @word = Word.find(params[:id])
  erb(:word_page)
end

post('/') do
  term = params["term"]
  definitions = params["definitions"]
  new_word = Word.new(term: term).save
  definitions.each do |definition|
    Definition.new(text: definition, word_id: new_word.id).save unless definition.empty?
  end

  @word_list = Word.sort()
  erb(:list)
end
