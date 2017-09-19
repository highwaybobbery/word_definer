require 'sinatra'
require 'sinatra/reloader'
also_reload('lib/**/*.rb')
require './lib/db_connection'
require './lib/word'
require 'pg'

DB = DbConnection.connection

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
  # definitions = params["definitions"]
  new_word = Word.new(term: term).save
  @word_list = Word.sort()
  erb(:list)
end
