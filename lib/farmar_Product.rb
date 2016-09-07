require_relative '../far_mar'
class FarMar::Product
  def initialize
    puts "Product initialized"
  end

  def self.all
    return #a collection of instances, representing all of the objects described in the CSV
  end

  def self.find(id)
    return #an instance of the object where the value of the id field in the CSV matches the passed parameter.
  end

  def vendor
    return #the FarMar::Vendor instance that is associated with this vendor using the FarMar::Product vendor_id field
  end

  def sales
    return #a collection of FarMar::Sale instances that are associated using the FarMar::Sale product_id field.
  end

  def number_of_sales
    return #the number of times this product has been sold
  end

  def self.by_vendor(vendor_id)
    return #all of the products with the given vendor_id
  end
end
