class User
  attr_accessor :interests, :zipcode
  
  def initialize
    @interests = []
  end
  
  def relevance_of(deal)
    deal.vendor.average_rating * 20
  end
  
  def best_deal_among(deals)
    deals.max_by { |d| relevance_of(d) }
  end
  
  def deal_score(deal)
    score = (relevance_of(deal) + deal.pct_savings) / 2
    interested?(deal) ? score : score / 2
  end
  
  def interested?(deal)
    !(interests & deal.types).empty?
  end
  
  def location_score_with(vendor)
    distance = Location.distance_between(zipcode, vendor.zipcode)
    [0, 100 - (distance / 20)].max
  end
end