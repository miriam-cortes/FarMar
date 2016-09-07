require_relative '../far_mar'

class FarMar::Market
  attr_accessor :name, :id, :address, :city, :county, :state, :zip, :market_hash
  def initialize(name,address,city,county,state,zip)
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
      market_hash[id] = self.new(name,address,city,county,state,zip)
    end
    return market_hash #a collection of instances, representing all of the objects described in the CSV
  end

  def self.find(id) #an instance of the object where the value of the id field in the CSV matches the passed parameter
    market = self.all
    return market[id]
  end

  def vendors #PUT THIS ON PAUSE AND WORK ON SELF.BY_MARKET FIRST!! (ACCORDING TO SSSSUSSSSSAN!)
    # vendors_array = []
    # market = self.all
    # # vendor = FarMar::Vendor.all
    # i = 1
    # market.each do |market_k,market_v|
    #   current_vendor = FarMar::Vendor.find(i)
    #   if market_k == current_vendor.market_id
    #     vendors_array[ (i - 1) ] << current_vendor
    #   end
    #   i += 1
    # end
    #
    # return  vendors_array #a collection of FarMar::Vendor instances that are associated with the market by the market_id field.
  end
end
