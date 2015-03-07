get '/users/:user_id/trips' do
  @user = User.find(params[:user_id])
  @destinations = Destination.all
  @trips = @user.trips
  erb :index
end
