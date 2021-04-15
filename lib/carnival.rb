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
    ride_array = []
    @rides.each do |ride|
      attendee.interests.each do |interest|
        if ride.name == interest
          ride_array << ride
        end
      end
    end
    ride_array
  end

  def attendees_by_ride_interest
    # @rides.each_with_object({}) do |ride, hash|
    #   @attendees.each do |attendee|
    #     recommend_rides(attendee).each do |ride|
    #       if ride == hash[ride]
    #         hash[ride] == attendee
    #       end
    #     end
    #   end
    # end
    @rides.each_with_object({}) do |ride, hash|
      @attendees.each do |attendee|
        attendee.interests.each do |interest|
          # require'pry';binding.pry
          if attendee.interests == interest
            hash[ride] << attendee.name
          end
        end
      end
    end
  end



end
