class Ride
  attr_reader :name,
              :cost
  def initialize(attributes)
    @name = attributes[:name]
    @cost = attributes[:cost]
  end  
end
