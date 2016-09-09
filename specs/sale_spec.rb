#FarMar::Sale specs
require_relative 'Spec_helper'
require_relative '../far_mar'

describe FarMar::Sale do

  let (:all_sales) { FarMar::Sale.all }
  let (:sale_20) { FarMar::Sale.find(20) }
  let (:sale_12001) { FarMar::Sale.find(12001) }
  let(:this_sale) { FarMar::Sale.between("2013-11-07 00:34:55 -0800","2013-11-07 14:34:57 -0800") }

  it 'tests the .all method contains 12002 sales...I see you, sneaky 00 sale!' do
    expect ( all_sales.length ).must_equal(12002)
  end

  it 'the .find class method' do
    expect ( sale_20.sale_amount ).must_equal(51)
    expect ( sale_20.id ).must_equal(20)
    expect ( sale_20.purchase_time ).must_equal("2013-11-10 09:48:05 -0800")
    expect ( sale_20.vendor_id ).must_equal(4)
    expect ( sale_20.product_id ).must_equal(5)
    expect ( sale_12001.sale_amount ).must_equal(8923)
    expect ( sale_12001.id ).must_equal(12001)
    expect ( sale_12001.purchase_time ).must_equal("2013-11-10 15:22:35 -0800")
    expect ( sale_12001.vendor_id ).must_equal(2690)
    expect ( sale_12001.product_id ).must_equal(8192)
  end

  it 'the vendor instance method' do
    expect ( sale_20.vendor.id ).must_equal( FarMar::Vendor.find(4).id )
    expect ( sale_12001.vendor.id ).must_equal( FarMar::Vendor.find(2690).id )
  end

  it 'the product instance method' do
    expect ( sale_20.product.id ).must_equal( FarMar::Product.find(5).id )
    expect ( sale_12001.product.id ).must_equal( FarMar::Product.find(8192).id )
  end

  it 'test the between class method' do
    expect ( this_sale.length ).must_equal(1012)
    expect ( this_sale[0].id ).must_equal(1)
    expect ( this_sale[1].id ).must_equal(34)
    expect ( this_sale[2].id ).must_equal(42)
    expect ( this_sale[3].id ).must_equal(64)
    expect ( this_sale[0].sale_amount ).must_equal(9290)
    expect ( this_sale[1004].sale_amount ).must_equal(9777)
    expect ( this_sale[1004].purchase_time ).must_equal("2013-11-07 07:39:53 -0800")
    expect ( this_sale[1004].vendor_id ).must_equal(2672)
    expect ( this_sale[1004].product_id ).must_equal(8131)
  end

end
