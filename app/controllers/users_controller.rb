get '/session-viewer' do
  session.inspect
end

#index    |get|    /users
get '/users' do
  @questions = Question.all
  erb :'index'
end

#new      |get|    /users/new
get '/users/new' do
  erb :'/users/new'
end

#create   |post|   /users
post '/users' do
  @user = User.new(params[:user])
  if @user.save
    session[:user_id] = @user.id
    redirect "/users/#{@user.id}"
  else
    status 422
    erb :'/users/new'
  end
end

#login    |get|    /users/:id/login
get '/users/login' do
  @user = User.new()
  erb :'/users/login'
end

#login    |post|   /users/:id
post '/users/login' do
  @user = User.authenticate(params[:user][:email], params[:user][:password])
  if @user
    session[:user_id] = @user.id
    redirect "/users/#{@user.id}"
  else
    @error = 'Invalid Login'
    status 422
    erb :'login'
  end
  # user_hash = params[:user]
  # user = User.authenticate(user_hash[:email], user_hash[:password])
  # if user
  #   session[:user_id] = user.id
  #   redirect '/secret'
  # else
  #   @user = User.new(user_hash)
  #   @user.errors.add(:name, "User does not exist!!!")
  #   erb :"login"
  # end
end

#logout   |get|    /users/logout
get '/users/logout' do
  @user = User.new()
  session[:user_id] = nil
  redirect :'/'
end


#show     |get|    /users/:id
get '/users/:id' do
  @user = User.find(params[:id])
  erb :'/users/show'
end



# #logout   |post|   /users/logout
# post '/users/logout' do
#   # @user = User.new()
#   # session[:user_id] = nil
#   # redirect '/'
# end

# #edit     |get|    /users/:id/edit
# get 'users/:id/edit' do
#   @user = User.find(params[:id])
#   erb :'edit'
# end

# #update   |patch|  /users/:id
# patch 'users/:id' do
#   @user = User.find(params[:id])
#   @user.update_attributes(params[:user])
#   redirect "/user/#{@user.id}"
# end

# #delete   |delete| /users/:id
# delete 'users/:id' do
#   @user = User.find(params[:id])
#   @user.destroy
#   redirect "/"
# end
