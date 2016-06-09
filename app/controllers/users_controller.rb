###################################################
############## login / logout #####################
###################################################

#login    |get|    /users/:id/login
get '/users/login' do
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
    erb :'/users/login'
  end
end

#logout
get '/users/logout' do
  session[:user_id] = nil
  redirect '/'
end

#logout   |post|   /users/logout
# post '/users/logout' do
#   # @user = User.new()
#   # session[:user_id] = nil
#   # redirect '/'
# end

#new
get '/users/new' do
  erb :'/users/new'
end

#create
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

#show
get '/users/:id' do
  @user = User.find(params[:id])
  erb :'/users/show'
end


###################################################
############## session viewer #####################
###################################################

get '/session-viewer' do
  session.inspect
end


###########################################################


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
