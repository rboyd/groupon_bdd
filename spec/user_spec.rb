require 'deal'
require 'user'

describe User do
  it 'has an initial score of zero' do
    deal = Deal.new(Vendor.new)
    user = User.new
    user.relevance_of(deal).should == 0
  end
  
  it 'grabs the average score of the merchant, normalized to 100' do
    vendor = Vendor.new
    vendor.add_rating(3)
    deal = Deal.new(vendor)
    user = User.new
    user.relevance_of(deal).should == 60
  end
  
  it 'gets the best of deals' do
    user = User.new
    bad_vendor = Vendor.new
    bad_vendor.add_rating(1)
    good_vendor = Vendor.new
    good_vendor.add_rating(4)
    bad_deal = Deal.new(bad_vendor)
    good_deal = Deal.new(good_vendor)
    user.best_deal_among(
      [bad_deal, good_deal]).should == good_deal
  end

  describe 'should have a deal score' do
    it 'which is the average of the rating score and the pct savings' do
      vendor = Vendor.new
      vendor.add_rating(4)

      deal = Deal.new(vendor)
      deal.sale_price = 15.0
      deal.real_price = 60.0

      user = User.new

      # slime interests
      deal.types << :food
      user.interests << :food

      user.deal_score(deal).should == 52.5
    end
    
    it 'should decide whether user is interested' do
      deal = Deal.new(nil)
      deal.types << :food
      deal.types << :services
      
      user = User.new
      user.interests << :goods
      
      user.should_not be_interested(deal)
      
      user.interests << :food
      user.should be_interested(deal)
    end
    
    it "which is lose half their value if the deal is not of a type in the user's interests" do
      vendor = Vendor.new
      vendor.add_rating(4)

      deal = Deal.new(vendor)
      deal.sale_price = 15.0
      deal.real_price = 60.0

      deal.types << :food
      
      user = User.new
      user.interests << :services

      user.deal_score(deal).should == 26.25
    end
  end
  
  it 'should have a list of interests' do
    user = User.new
    user.interests << :goods
    user.interests << :services
    user.interests.count.should == 2
  end

end