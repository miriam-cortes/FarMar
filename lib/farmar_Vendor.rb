#FarMar::Vendor
# require_relative '../far_mar'
class FarMar::Vendor
  attr_reader :id, :name, :number_employees, :market_id
  def initialize(id,name,number_employees,market_id)
    @id = id
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
      vendor_hash[id] = self.new(id,name,number_employees,market_id)
    end
    return vendor_hash #a collection of instances, representing all of the objects described in the CSV
  end

  def self.find(id)
    vendors = self.all
    return vendors[id] #instance of object where value of id field in CSV matches passed parameter.
  end

  def market
    return FarMar::Market.find(self.market_id)
    #FarMar::Market instance associated with vendor using FarMar::Vendor market_id field
  end

  def products
    products = []
    ( FarMar::Product.all ).each do |k,product_object|
      if product_object.vendor_id > self.id #just break out of loop if you've gone beyond the wanted product
        break
      end
      if product_object.vendor_id == self.id
        products << product_object
      end
    end
    return products #a collection of FarMar::Product instances that are associated by the FarMar::Product vendor_id field.
  end

  def sales
    sales = []
    i = 1
    ( FarMar::Sale.all ).each do |k,sale_object|
      if sale_object.vendor_id > self.id #just break out of loop if you've gone beyond the wanted product
        break
      end
      if sale_object.vendor_id == self.id
        sales << sale_object
      end
      i += 1
    end
    return sales #a collection of FarMar::Sale instances that are associated by the vendor_id field.
  end

  def revenue
    sum = 0
    ( FarMar::Sale.all ).each do |k,sale_object|
      if sale_object.vendor_id == self.id
        sum += sale_object.sale_amount
      end
    end

    return sum/100.0 #the the sum of all of the vendor's sales (in cents)
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
