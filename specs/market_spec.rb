#FarMar::Market specs
require_relative 'Spec_helper'
require_relative '../far_mar'


describe FarMar::Market do

  let(:all_markets) { FarMar::Market.all }
  let(:market_500) { FarMar::Market.find(500) }

  it '1- .all class method' do
    expect ( all_markets.length ).must_equal(500)
  end

  it '2- .find class method' do
    expect ( market_500.name ).must_equal("Montefiore Medical Center Farmers Market_Thursday")
    expect ( market_500.address ).must_equal("111 E. 210th Street")
    expect ( market_500.city ).must_equal("Bronx")
    expect ( market_500.state ).must_equal("New York")
    expect ( market_500.county ).must_equal("Bronx")
    expect ( market_500.zip ).must_equal(10467)
  end

  it '4- vendors instance method' do
    expect ( market_500.vendors.length ).must_equal( 10 )
    expect ( market_500.vendors[0].name ).must_match( "Erdman-Blanda" )
    expect ( market_500.vendors[1].name ).must_match( "Quigley, Nienow and Lang" )
    expect ( market_500.vendors[2].name ).must_match( "Wiza-Mills" )
    expect ( market_500.vendors[3].name ).must_match( "Bahringer Group" )
    expect ( market_500.vendors[4].name ).must_match( "Rolfson-Willms" )
    expect ( market_500.vendors[5].number_employees ).must_equal(9)
    expect ( market_500.vendors[4].number_employees ).must_equal(5)
    expect ( market_500.vendors[9].name ).must_equal( "Mann-Lueilwitz" )
  end

end
