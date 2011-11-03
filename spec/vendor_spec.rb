require 'vendor'

describe Vendor do
  describe 'it has ratings' do
    it 'starts with an average of zero' do
      vendor = Vendor.new
      vendor.average_rating.should == 0
    end
    
    it 'can average ratings' do
      vendor = Vendor.new
      vendor.add_rating(3)
      vendor.add_rating(5)
      vendor.ratings.should =~ [3, 5]
      vendor.average_rating.should == 4
    end
    
    it 'should have a zipcode'
  end
end