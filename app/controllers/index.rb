get '/users/:user_id/trips' do
  @user = User.find(params[:user_id])
  @destinations = Destination.all
  @trips = @user.trips
  erb :index
end

get '/users/:user_id/trips/new' do 
	@user = User.find(params[:user_id])
	erb :'trips/new'
end

post '/users/:user_id/trips' do
	#find by or create, finds the destination or creates a new destination
	puts params
	@destination = Destination.find_or_create_by(name: params[:destination])

	#creates a new trip
	@trip = Trip.new(destination: @destination, user_id: session[:user_id], days: params[:days])


	if @trip.save
		redirect "/users/#{params[:user_id]}/trips"
	else
		# @message = "please fill out!"
		redirect "/users/#{params[:user_id]}/trips/new"
		# erb :'trips/new'
	end
end



