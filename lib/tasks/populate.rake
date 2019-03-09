namespace :populate do
  desc "Populate Trips"
  task trips: :environment do
    numbers = *(1..99)
    10.times do 
      trip = Trip.create(name: Faker::WorldCup.team, user_id: 1)
      4.times {Location.create(name: Faker::Name.name, 
        days: numbers.sample, trip_id: trip.id)}
      end
    end
    puts "data seeded"
  end

