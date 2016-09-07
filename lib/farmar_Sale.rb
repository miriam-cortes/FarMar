require_relative '../far_mar'
class FarMar::Sale
  def initialize
    puts "Sale initialized"
  end

  def self.all
    # returns a collection of instances, representing all of the objects described in the CSV
  end

  def self.find(id)
    #returns an instance of the object where the value of the id field in the CSV matches the passed parameter.
  end

  def vendor
    return #the FarMar::Vendor instance that is associated with this sale using the FarMar::Sale vendor_id field
  end

  def product
    return #the FarMar::Product instance that is associated with this sale using the FarMar::Sale product_id field
  end

  def self.between(beginning_time, end_time)
    return #a collection of FarMar::Sale objects where the purchase time is between the two times given as arguments
  end
  
end
