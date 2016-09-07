#FarMar::Vendor specs
require_relative 'Spec_helper'
require_relative '../lib/farmar_Market'
require_relative '../lib/farmar_Vendor'
require_relative '../lib/farmar_Sale'
require_relative '../lib/farmar_Product'
require_relative '../far_mar'

describe FarMar::Vendor do
  it 'the .find class method' do
    vendor_25 = FarMar::Vendor.find(25)
    expect ( vendor_25.name ).must_equal("Veum, Dickinson and Conroy")
  end

  it 'the .by_market class method' do
   market_7 = FarMar::Vendor.by_market(7)
   expect( market_7.length ).must_equal(2)
  end
end
