require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/definition')
require('./lib/words')

get('/') do
  @words = Word.all()
  erb(:index)
end

get('/word_form') do
  erb(:word_form)
end

post('/words') do
  word = params.fetch('new_word')
  Word.new({:word => word}).save()
  @wordslist = Word.all()
  erb(:success)
end

get('/word/:id') do
  @word = Word.find(params.fetch('id').to_i())
  erb(:word)
end

get('/words/:id/definitions/new') do
  @words = Word.find(params.fetch('id').to_i())
  erb(:word)
end
