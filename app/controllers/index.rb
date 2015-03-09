# Find user
get '/users/:user_id/trips' do
  @user = User.find(params[:user_id])
  @trips = @user.trips
  erb :index
end

# Get trip form
get '/users/:user_id/trips/new' do
	@user = User.find(params[:user_id])
	erb :'trips/new'
end

post '/users/:user_id/trips' do
	# find by or create, finds the destination or creates a new destination
	@destination = Destination.find_or_create_by(name: params[:destination])
	# creates a new trip, includes destination object, id for current user, days
  @trip = @destination.trips.new(days: params[:days])
  @user = User.find(params[:user_id])
  @user.trips << @trip
	# @trip = Trip.new(destination: @destination, user_id: session[:user_id], days: params[:days])
  # save trip if includes all params and redirect
	if @trip.save
		redirect "/users/#{params[:user_id]}/trips"
	else
		@message = "please fill out!"
		redirect "/users/#{params[:user_id]}/trips"
	end
end

# find user, find trip by user_id, show restaurants
get '/users/:user_id/trips/:trip_id/restaurants' do
  @user = User.find(params[:user_id])
 # @user_trip = Trip.find_by(user: @user.id)
  @destinations = @user.destinations

	erb :'/restaurants/index'
end

post '/users/:user_id/trips/:trip_id/restaurants' do
 @user = User.find(params[:user_id])
 @reviews = @user.reviews
 @restaurant = reviews.restaurants.new(name: params[:name], rating: params[:rating])
 @restaurant.save
  redirect "/users/#{@user.id}/trips/#{@user_trip.id}/restaurants"
  # erb :'/restaurants/index'
end

get '/users/:user_id/trips/:trip_id/restaurants/review' do
 @user = User.find(params[:user_id])
 @user_trip = Trip.find_by(user: @user.id)
 @restaurants = @user_trip.destination.restaurants
 erb :'/restaurants/review'
end

post '/users/:user_id/trips/:trip_id/restaurants/review' do
 @user = User.find(params[:user_id])
 @user_trip = Trip.find_by(user: @user.id)
 @restaurants = @user_trip.destination.restaurants
 erb :'/restaurants'
end

get '/users/:user_id/trips/:trip_id/restaurants/review/new' do
 @user = User.find(params[:user_id])
 @user_trip = Trip.find_by(user: @user.id)
 @restaurants = @user_trip.destination.restaurants


  if request.xhr? #recieves request, send below
    erb :'restaurants/_new', layout: false
  else
    redirect '/users/#{params[:user_id]}/trips/#{params[:trip_id]}/restaurants'
  end
end