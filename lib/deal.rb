class Deal
  attr_accessor :vendor, :sale_price, :real_price, :types

  def initialize(vendor)
    @vendor = vendor
    @types = []
  end
  
  def pct_savings
    (sale_price / real_price) * 100.0
  end
end