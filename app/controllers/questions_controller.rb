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

post '/questions/:id/answers' do
  @answer = Answer.new(content: params[:content], question_id: params[:question_id])
  @answer.user_id = current_user.id
  @answer.save
  redirect "/questions/#{@answer.question.id}"
end

get '/questions/:id/answers' do
  @answers = Question.find(params[:id]).answers
  erb :show
end

get '/questions/:id/upvote' do
  p "Got to request"
  @question = Question.find(params[:id])
  vote = Vote.new(value: 1, user_id: session[:user_id])
  vote.voteable = @question
  vote.save

  if request.xhr?
    p "Got to xhr"
    {count: @question.votes.sum(:value).to_s}.to_json
  else
    redirect "/questions/#{params[:id]}"
  end
end

get '/questions/:id/downvote' do
  @question = Question.find(params[:id])
  vote = Vote.new(value: -1, user_id: session[:user_id])
  vote.voteable = @question
  vote.save
  redirect "/questions/#{params[:id]}"
end


post '/questions/:id/responses' do
  question = Question.find(params[:id])
  Response.create!(respondable_id: question.id, respondable_type: 'Question', user_id: session[:user_id], content: params[:content] )
  redirect "/questions/#{question.id}"
end


# ANSWERS CONTROLLER



post '/answers/:id/responses' do
  answer = Answer.find(params[:id])
  Response.create!(respondable_id: answer.id, respondable_type: 'Answer', user_id: session[:user_id], content: params[:content] )
  redirect "/questions/#{answer.question_id}"
end

# get '/answers/:id/upvote' do
#   p "Got to request"
#   @answer = Answer.find(params[:id])
#   vote = Vote.new(value: 1, user_id: session[:user_id])
#   vote.voteable = @answer
#   vote.save

#   if request.xhr?
#     p "Got to xhr"
#     {count: @answer.votes.sum(:value).to_s}.to_json
#   else
#     redirect "/questions/#{params[:id]}"
#   end
# end

# get '/answer/:id/downvote' do
#   @answer = Answer.find(params[:id])
#   vote = Vote.new(value: -1, user_id: session[:user_id])
#   vote.voteable = @answer
#   vote.save
#   redirect "/questions/#{params[:id]}"
# end





