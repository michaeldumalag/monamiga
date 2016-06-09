get '/questions' do
  @questions = Question.all
  erb :'index'
end
