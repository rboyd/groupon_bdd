require 'deal'

describe Deal do
  it 'should have a sale price and a real price, which implies a pct savings' do
    deal = Deal.new(nil)
    deal.sale_price = 30.0
    deal.real_price = 100.0
    deal.pct_savings.should == 30
  end
  
  it 'should have one or more types' do
    deal = Deal.new(nil)
    deal.types << :food
    deal.types << :goods
    deal.types.count.should == 2
  end
end