# index
get '/questions' do
  @questions = Question.all
  erb :'index'
end

# new
get '/questions/new' do
  if current_user
    erb :'/questions/new'
  else
    status 403
    erb :'403'
  end
end

# show
get '/questions/:id' do
  @question = Question.find(params[:id])
  erb :'/questions/show'
end

# create - TODO
post '/questions' do
  @question = Question.new(params[:question])
  @question.user_id = current_user.id
  if @question.save
    redirect "/users/#{current_user.id}"
  else
    status 422
    erb :'/questions/new'
  end
end
