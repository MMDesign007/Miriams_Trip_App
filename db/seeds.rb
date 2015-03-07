user_one   = User.create(name: "Miriam", email: "m@gmail.com",     password: "m")
user_two   = User.create(name: "Kara",   email: "k@gmail.com",     password: "k")
user_three = User.create(name: "Nadya",  email: "nadya@gmail.com", password: "n")

destination_one   = Destination.create(name: "Hawaii",    setting: "Tropical")
destination_two   = Destination.create(name: "Bahamas",   setting: "Tropical")
destination_three = Destination.create(name: "Barcelona", setting: "City Life")

trip_one   = Trip.create(destination: destination_one,   user: user_one,   days: 5,  completed?: true)
trip_two   = Trip.create(destination: destination_two,   user: user_two,   days: 7,  completed?: true)
trip_three = Trip.create(destination: destination_three, user: user_three, days: 10, completed?: true)

restaurant_one   = Restaurant.create(destination: destination_one, name: "Yum Buffet", rating: 5)
restaurant_two   = Restaurant.create(destination: destination_two, name: "Mama's Italian Restaurant", rating: 10)
restaurant_three = Restaurant.create(destination: destination_three, name: "Cookie Monster's Kitchen", rating: 9)

review_one   = Review.create(restaurant: restaurant_one,   user: user_one)
review_two   = Review.create(restaurant: restaurant_two,   user: user_two)
review_three = Review.create(restaurant: restaurant_three, user: user_three)

