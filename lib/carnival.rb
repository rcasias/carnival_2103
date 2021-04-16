class Carnival
  attr_reader :name,
              :rides,
              :attendees
  def initialize(name)
    @name = name
    @rides = []
    @attendees = []
  end

  def add_ride(ride)
    @rides << ride
  end

  def admit(attendee)
    @attendees << attendee
  end

  def recommend_rides(attendee)
    @rides.find_all do |ride|
      attendee.interests.include?(ride.name)
    end
  end

  def attendees_by_ride_interest
    ride_hash = @rides.each_with_object({}) do |ride, hash|
      hash[ride] =[]
    end

    @attendees.each do |attendee|
      recommend_rides(attendee).each do |ride|
          if attendee.interests.include?(ride.name)
            ride_hash[ride] << attendee
          else
            ride_hash[ride] ==[attendee]
          end
        end
      end
    ride_hash
  end

  def ticket_lottery_contestant(ride)
    tickets = []
      attendees_by_ride_interest.each do |key, value|
        if key.name == ride.name
          value.each do |value|
            if value.spending_money < key.cost
              tickets << value
            end
          end
        end
    end.flatten
    tickets.flatten
  end
  # require'pry';binding.pry
  def draw_lottery_winner(ride)
    conticket_lottery_contestant(ride)
  end


end
