require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/word')
require('pry')

get('/') do
  @word_list = Word.all()
  erb(:list)
end

get('/word/:id') do
  @word = Word.find(params[:id])
  erb(:word_page)
end

post('/') do
  word = params["word"]
  definitions = params["definitions"]
  word_info = { "word" => word, "definitions" => definitions }
  new_word = Word.new(word_info)
  new_word.add_word()
  @word_list = Word.sort()
  erb(:list)
end
