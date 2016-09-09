# require_relative '../far_mar'
class FarMar::Product
  attr_reader :id, :name, :vendor_id
  def initialize(id,product,vendor_id)
    @id = id
    @name = product
    @vendor_id = vendor_id
  end

  def self.all
    product_hash = {}
    CSV.read("/Users/miriamcortes/ada/wk5/farmar/support/products.csv").each do |line|
      id = line[0].to_i #ID is the key for the market_hash
      product = line[1]
      vendor_id = line[2].to_i
      product_hash[id] = self.new(id,product,vendor_id)
      if product[0] == "22"
        puts product
      end
    end
    return product_hash #collection of instances, representing all objects described in CSV
  end

  def self.find(id)
    products = self.all
    return products[id] #instance of object where value of id in CSV matches parameter
  end

  def vendor
    return FarMar::Vendor.find(self.vendor_id) #FarMar::Vendor instance associated with this vendor using the FarMar::Product vendor_id field
  end

  def sales
    product_sales_array = []
    (FarMar::Sale.all).each do |k,sale_object|
      if sale_object.product_id == self.id
        product_sales_array << sale_object
      end
    end
    return product_sales_array #a collection of FarMar::Sale instances that are associated using the FarMar::Sale product_id field.
  end

  def number_of_sales
    how_many_sales = 0
    ( FarMar::Sale.all ).each do |k, sale_object|
      if sale_object.product_id == self.id
        how_many_sales += 1
      end
    end
    return how_many_sales #the number of times this product has been sold
  end

  def self.by_vendor(vendor_id)
    vendor_array = []
    ( self.all ).each do |k,v|
      if v.vendor_id == vendor_id
        vendor_array << v
      end
    end
    return vendor_array #all of the products with the given vendor_id
  end
end
