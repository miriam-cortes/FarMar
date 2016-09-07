#FarMar::Vendor
require_relative '../far_mar'
class FarMar::Vendor
  attr_accessor :name, :number_employees, :market_id
  def initialize(name,number_employees,market_id)
    @name = name
    @number_employees = number_employees
    @market_id = market_id
  end

  def self.all
    vendor_hash = {}
    CSV.read("/Users/miriamcortes/ada/wk5/farmar/support/vendors.csv").each do |account|
      id = account[0].to_i #ID is the key for the market_hash
      name = account[1]
      number_employees = account[2].to_i
      market_id = account[3].to_i
      vendor_hash[id] = self.new(name,number_employees,market_id)
    end
    return vendor_hash #a collection of instances, representing all of the objects described in the CSV
  end

  def self.find(id)
    vendors = self.all
    return vendors[id] #an instance of the object where the value of the id field in the CSV matches the passed parameter.
  end

  def market
    # vendors = self.all
    # vendors.each do |account|
    #   FarMar::Market.find(account[3].to_i)
    # end
    #
    return  #the FarMar::Market instance that is associated with this vendor using the FarMar::Vendor market_id field
  end
  def products
    return #a collection of FarMar::Product instances that are associated by the FarMar::Product vendor_id field.
  end

  def sales
    return #a collection of FarMar::Sale instances that are associated by the vendor_id field.
  end

  def revenue
    return #the the sum of all of the vendor's sales (in cents)
  end

  def self.by_market(market_id)
    market_array = []
    ( self.all ).each do |k,v|
      if v.market_id == market_id
        market_array << v
      end
    end
    return market_array#all of the vendors with the given market_id
  end

end

# vendors = FarMar::Vendor.all
# puts FarMar::Vendor.find(15).market_id
# puts vendor15.market_id
# vendors.market_id
# ap FarMar::Vendor.by_market(7) #
