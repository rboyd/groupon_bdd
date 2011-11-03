class Vendor
  def initialize
    @ratings = []
  end
  
  attr_accessor :ratings, :zipcode

  def average_rating
    return 0 if ratings.empty?
    ratings.inject(:+) * 1.0 / ratings.count
  end
  
  def add_rating(rating)
    ratings << rating
  end
end