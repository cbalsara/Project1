require( 'minitest/autorun' )
require_relative( '../models/category' )
require ("minitest/rg")

class TestCategory < MiniTest::Test

  def setup 
    options = {
      'type' => 'Clothes'
    }
    @category = Category.new(options)
  end 

  def test_category_type()
    assert_equal( 'Clothes', @category.type() )
  end 

end 