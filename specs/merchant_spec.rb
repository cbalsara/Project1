require( 'minitest/autorun' )
require_relative( '../models/merchant' )
require ("minitest/rg")

class TestMerchant < MiniTest::Test

  def setup 
    options = {
      'name' => 'Tesco'
    }
    @merchant = Merchant.new(options)
  end 

  def test_merchant_name()
    assert_equal( 'Tesco', @merchant.name() )
  end 

end 