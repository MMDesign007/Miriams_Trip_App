get '/' do
  redirect '/login'
end

get '/login' do
  erb :login
end

post '/login' do
  @user = User.authenticate(params[:email], params[:password])
  if @user
    session[:user_id] = @user.id
    redirect "/users/#{@user.id}/trips"
  else
    redirect '/login'
  end
end




