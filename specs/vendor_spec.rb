#FarMar::Vendor specs
require_relative 'Spec_helper'
require_relative '../far_mar'

describe FarMar::Vendor do

  let(:all_vendors) { FarMar::Vendor.all }
  let(:vendor_25) { FarMar::Vendor.find(25) }
  let(:vendor_25_sales) { vendor_25.sales }
  let(:vendor_22) { FarMar::Vendor.find(22) }
  let(:vendor_22_sales) { vendor_22.sales }
  let(:market_7) { FarMar::Vendor.by_market(7) }

  it 'Tests the .all method contains all 2690 instances' do
    expect ( all_vendors.length ).must_equal(2690)
  end

  it 'the .find class method' do
    expect ( vendor_25.name ).must_equal("Veum, Dickinson and Conroy")
    expect ( vendor_25.id ).must_equal(25)
    expect ( vendor_25.number_employees ).must_equal(9)
    expect ( vendor_25.market_id ).must_equal(8)
  end

  it 'the .by_market class method' do
   expect( market_7.length ).must_equal(2)
   expect( market_7[0].name ).must_equal("Runolfsson and Sons")
   expect( market_7[1].name ).must_equal("Wilderman, Marks and Luettgen")
   expect( market_7[0].id ).must_equal(22)
   expect( market_7[1].id ).must_equal(23)
   expect( market_7[0].number_employees ).must_equal(2)
   expect( market_7[1].number_employees ).must_equal(3)
   expect( market_7[0].market_id ).must_equal(7)
   expect( market_7[1].market_id ).must_equal(7)
  end

  it 'Test market instance method' do
    expect ( vendor_22.market.id ).must_equal( FarMar::Market.find(7).id )
    expect ( vendor_22.market.id ).must_equal( 7 )
    expect ( vendor_22.market.name ).must_equal( "Petaluma Evening Farmers' Market" )
    expect ( vendor_22.market.address ).must_equal( "1 2nd Street" )
    expect ( vendor_22.market.city ).must_equal( "Petaluma" )
    expect ( vendor_22.market.county ).must_equal( "Sonoma" )
    expect ( vendor_22.market.state ).must_equal( "California" )
    expect ( vendor_22.market.zip ).must_equal( 94952 )
  end

  it 'Test products instance method' do
    expect ( vendor_22.products.length ).must_equal( 4 )
    expect ( vendor_22.products[0].name ).must_equal( "Fresh Apples" )
    expect ( vendor_22.products[1].name ).must_equal( "Worried Pretzel" )
    expect ( vendor_22.products[2].name ).must_equal( "Homeless Honey" )
    expect ( vendor_22.products[3].name ).must_equal( "Loose Fish" )
    expect ( vendor_22.products[0].id ).must_equal( 64 )
    expect ( vendor_22.products[1].id ).must_equal( 65 )
    expect ( vendor_22.products[2].id ).must_equal( 66 )
    expect ( vendor_22.products[3].id ).must_equal( 67 )
  end

  it 'Test sales instance method' do
    expect ( vendor_25_sales[0].id ).must_equal( 125 )
    expect ( vendor_25_sales[0].sale_amount ).must_equal( 3128 )
    expect ( vendor_25_sales[0].purchase_time ).must_equal( "2013-11-08 06:34:47 -0800" )
    expect ( vendor_25_sales[0].vendor_id ).must_equal( 25 )
    expect ( vendor_25_sales[0].product_id ).must_equal( 74 )

    expect ( vendor_25_sales[1].id ).must_equal( 126 )
    expect ( vendor_25_sales[1].sale_amount ).must_equal( 4221 )
    expect ( vendor_25_sales[1].purchase_time ).must_equal( "2013-11-10 22:36:50 -0800" )
    expect ( vendor_25_sales[1].vendor_id ).must_equal( 25 )
    expect ( vendor_25_sales[1].product_id ).must_equal( 74 )

    expect ( vendor_25_sales[2].id ).must_equal( 127 )
    expect ( vendor_25_sales[2].sale_amount ).must_equal( 5790 )
    expect ( vendor_25_sales[2].purchase_time ).must_equal( "2013-11-08 06:20:42 -0800" )
    expect ( vendor_25_sales[2].vendor_id ).must_equal( 25 )
    expect ( vendor_25_sales[2].product_id ).must_equal( 74 )

    expect ( vendor_25_sales[3].id ).must_equal( 128 )
    expect ( vendor_25_sales[3].sale_amount ).must_equal( 1143 )
    expect ( vendor_25_sales[3].purchase_time ).must_equal( "2013-11-06 08:40:22 -0800" )
    expect ( vendor_25_sales[3].vendor_id ).must_equal( 25 )
    expect ( vendor_25_sales[3].product_id ).must_equal( 74 )

    expect ( vendor_25_sales[4].id ).must_equal( 129 )
    expect ( vendor_25_sales[4].sale_amount ).must_equal( 1195 )
    expect ( vendor_25_sales[4].purchase_time ).must_equal( "2013-11-10 10:40:40 -0800" )
    expect ( vendor_25_sales[4].vendor_id ).must_equal( 25 )
    expect ( vendor_25_sales[4].product_id ).must_equal( 74 )

    expect ( vendor_25_sales[5].id ).must_equal( 130 )
    expect ( vendor_25_sales[5].sale_amount ).must_equal( 9173 )
    expect ( vendor_25_sales[5].purchase_time ).must_equal( "2013-11-09 18:43:19 -0800" )
    expect ( vendor_25_sales[5].vendor_id ).must_equal( 25 )
    expect ( vendor_25_sales[5].product_id ).must_equal( 74 )

    expect ( vendor_25_sales[6].id ).must_equal( 131 )
    expect ( vendor_25_sales[6].sale_amount ).must_equal( 4911 )
    expect ( vendor_25_sales[6].purchase_time ).must_equal( "2013-11-12 05:43:19 -0800" )
    expect ( vendor_25_sales[6].vendor_id ).must_equal( 25 )
    expect ( vendor_25_sales[6].product_id ).must_equal( 74 )

    expect ( vendor_22_sales[0].id ).must_equal( 112 )
    expect ( vendor_22_sales[0].sale_amount ).must_equal( 7797 )
    expect ( vendor_22_sales[0].purchase_time ).must_equal( "2013-11-11 13:48:16 -0800" )
    expect ( vendor_22_sales[0].vendor_id ).must_equal( 22 )
    expect ( vendor_22_sales[0].product_id ).must_equal( 64 )

    expect ( vendor_22_sales[1].id ).must_equal( 113 )
    expect ( vendor_22_sales[1].sale_amount ).must_equal( 4564 )
    expect ( vendor_22_sales[1].purchase_time ).must_equal( "2013-11-06 18:33:45 -0800" )
    expect ( vendor_22_sales[1].vendor_id ).must_equal( 22 )
    expect ( vendor_22_sales[1].product_id ).must_equal( 64 )

    expect ( vendor_22_sales[2].id ).must_equal( 114 )
    expect ( vendor_22_sales[2].sale_amount ).must_equal( 4548 )
    expect ( vendor_22_sales[2].purchase_time ).must_equal( "2013-11-08 01:47:50 -0800" )
    expect ( vendor_22_sales[2].vendor_id ).must_equal( 22 )
    expect ( vendor_22_sales[2].product_id ).must_equal( 65 )

    expect ( vendor_22_sales[3].id ).must_equal( 115 )
    expect ( vendor_22_sales[3].sale_amount ).must_equal( 7870 )
    expect ( vendor_22_sales[3].purchase_time ).must_equal( "2013-11-10 07:07:29 -0800" )
    expect ( vendor_22_sales[3].vendor_id ).must_equal( 22 )
    expect ( vendor_22_sales[3].product_id ).must_equal( 66 )

    expect ( vendor_22_sales[4].id ).must_equal( 116 )
    expect ( vendor_22_sales[4].sale_amount ).must_equal( 6858 )
    expect ( vendor_22_sales[4].purchase_time ).must_equal( "2013-11-09 06:00:22 -0800" )
    expect ( vendor_22_sales[4].vendor_id ).must_equal( 22 )
    expect ( vendor_22_sales[4].product_id ).must_equal( 67 )

    expect ( vendor_22_sales[5].id ).must_equal( 117 )
    expect ( vendor_22_sales[5].sale_amount ).must_equal( 7912 )
    expect ( vendor_22_sales[5].purchase_time ).must_equal( "2013-11-10 08:21:58 -0800" )
    expect ( vendor_22_sales[5].vendor_id ).must_equal( 22 )
    expect ( vendor_22_sales[5].product_id ).must_equal( 65 )

  end

  it 'Test revenue instance method' do
    expect ( vendor_25.revenue ).must_equal(295.61)
    expect ( vendor_22.revenue ).must_equal(395.49)
  end

end
