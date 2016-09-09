
class FarMar::Sale
  attr_reader :id, :sale_amount, :purchase_time, :vendor_id, :product_id
  def initialize(id,sale_amount,purchase_time,vendor_id,product_id)
    @id = id
    @sale_amount = sale_amount
    @purchase_time = purchase_time
    @vendor_id = vendor_id
    @product_id = product_id
  end

  def self.all
    sale_hash = {}
    CSV.read("/Users/miriamcortes/ada/wk5/farmar/support/sales.csv").each do |sale|
      id = sale[0].to_i #ID is the key for the market_hash
      sale_amount = (sale[1].to_i) #/ 100.0
      purchase_time = sale[2]
      vendor_id = sale[3].to_i
      product_id = sale[4].to_i
      sale_hash[id] = self.new(id,sale_amount,purchase_time,vendor_id,product_id)
    end
    return sale_hash #collection of instances, representing all of the objects described in the CSV
  end

  def self.find(id)
    sales = self.all
    return sales[id] #instance of object where value of the id in the CSV matches parameter
  end

  def vendor
    return FarMar::Vendor.find(self.vendor_id) #returns the FarMar::Vendor instance associated with this sale using the FarMar::Sale vendor_id field
  end

  def product
    return FarMar::Product.find(self.product_id)#the FarMar::Product instance that is associated with this sale using the FarMar::Sale product_id field
  end

  def self.between(beginning_time, end_time)
    time_array = []
    ( self.all ).each do |k,v|
      if Time.parse(v.purchase_time) < Time.parse(end_time) && Time.parse(v.purchase_time) > Time.parse(beginning_time)
        time_array << v
      end
    end
    return time_array #a collection of FarMar::Sale objects where the purchase time is between the two times given as arguments
  end

end
