# require_relative '../far_mar'
# require_relative 'farmar_Vendor'

class FarMar::Market
  attr_reader :name, :id, :address, :city, :county, :state, :zip, :market_hash
  def initialize(id,name,address,city,county,state,zip)
    @id = id
    @name = name
    @address = address
    @city = city
    @county = county
    @state = state
    @zip = zip
  end

  def self.all
    market_hash = {}
    CSV.read("/Users/miriamcortes/ada/wk5/farmar/support/markets.csv").each do |account|
      id = account[0].to_i #ID is the key for the market_hash
      name = account[1]
      address = account[2]
      city = account[3]
      county = account[4]
      state = account[5]
      zip = account[6].to_i
      market_hash[id] = self.new(id,name,address,city,county,state,zip)
    end
    return market_hash #a collection of instances, representing all of the objects described in the CSV
  end

  def self.find(id) #an instance of the object where the value of the id field in the CSV matches the passed parameter
    market = self.all
    return market[id]
  end

  def vendors
    vendors_array = []
    ( FarMar::Vendor.all ).each do |k,vendor_object|
      if vendor_object.market_id > self.id
        break
      end
      if vendor_object.market_id == self.id
        vendors_array << vendor_object
      end
    end

    return  vendors_array #a collection of FarMar::Vendor instances that are associated with the market by the market_id field.
  end
end
