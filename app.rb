require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/word')
require('pry')

get('/') do
  @list = Word.all()
  erb(:list)
end

get('/word/:id') do
  @word = Word.find(params[:id])
  erb(:word_page)
end

post('/') do
  first_name = params["word"]
  word_info = {"word" => word, }
  word = Word.new(word_info)
  word.add_word()
  @list = Word.all()
  erb(:list)
end
