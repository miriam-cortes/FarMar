#FarMar::Market specs
require_relative 'Spec_helper'
require_relative '../lib/farmar_Market'
require_relative '../lib/farmar_Vendor'
require_relative '../lib/farmar_Sale'
require_relative '../lib/farmar_Product'
require_relative '../far_mar'


describe FarMar::Market do

  describe 'inner block' do
    let( thing = FarMar::Market.all )
    it 'Tests the .all method contains all 500 instances' do
      expect ( thing.length ).must_equal(500)
    end


    it 'Tests .find for Market 500' do
      market_number = FarMar::Market.find(500)
      expect ( market_number.name ).must_equal("Montefiore Medical Center Farmers Market_Thursday")
    end
    # let ( market_number = FarMar::Market.find(25) )
    it 'Tests .find for Market 25' do
      market_number = FarMar::Market.find(25)
      expect ( market_number.address ).must_equal("1 Courthouse Square")
    end
  end

  # it 'Tests the vendors instance method' do
  #   vendors = FarMar::Vendor.all
  #   FarMar::Vendor.find(15).market_id
  #   market_1 = FarMar::Market.all
  #
  #   expect ( market_1.vendors ).must_equal( ["Feil-Farrell","Hamill, Kilback and Pfeffer","Breitenberg Inc","Kris and Sons","Reynolds, Schmitt and Klocko","Zulauf and Sons"] )
  # end
end
