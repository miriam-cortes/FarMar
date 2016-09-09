#FarMar::Product specs
require_relative 'Spec_helper'
require_relative '../far_mar'

describe FarMar::Product do

  let(:all_products) { FarMar::Product.all }
  let(:product_3) { FarMar::Product.find(3) }
  let(:product_4) { FarMar::Product.find(4) }
  let(:product_8193) { FarMar::Product.find(8193) }
  let(:this_product) { FarMar::Product.by_vendor(22)}

  it 'the .all method contains all 8193 instances' do
    expect ( all_products.length ).must_equal(8193)
  end

  it 'the .find class method works for products' do
    expect ( product_3.name ).must_equal("Heavy Chicken")
    expect ( product_3.id ).must_equal( 3 )
    expect ( product_3.vendor_id ).must_equal( 2 )
  end

  it 'test the vendor instance method' do
    expect (product_3.vendor.id).must_equal(FarMar::Vendor.find(2).id)
  end

  it 'test the sales instance method' do
    expect ( product_3.sales ).must_equal([])
    expect ( product_4.sales.length ).must_equal(8)
    expect ( product_4.sales[0].id ).must_equal(9)
    expect ( product_4.sales[0].sale_amount ).must_equal(9128)
    expect ( product_4.sales[0].purchase_time ).must_equal("2013-11-13 01:48:15 -0800")
    expect ( product_4.sales[0].vendor_id ).must_equal(3)
    expect ( product_4.sales[0].product_id ).must_equal(4)
    expect ( product_8193.sales[0].id ).must_equal(12000)
  end

  it 'test the number_of_sales instance method' do
    expect ( product_3.number_of_sales ).must_equal(0)
    expect ( product_8193.number_of_sales ).must_equal(1)
    expect ( product_4.number_of_sales ).must_equal(8)
  end

  it 'test the by_vendor class method' do
    expect ( this_product.length ).must_equal(4)
    expect ( this_product[0].name ).must_equal("Fresh Apples")
    expect ( this_product[1].name ).must_equal("Worried Pretzel")
    expect ( this_product[2].name ).must_equal("Homeless Honey")
    expect ( this_product[3].name ).must_equal("Loose Fish")
  end
end
