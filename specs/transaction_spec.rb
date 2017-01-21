require( 'minitest/autorun' )
require_relative( '../models/transaction' )
require ("minitest/rg")

class TestTransaction < MiniTest::Test

  def setup 
    options = {
      'cost' => 35.30
    }
    @transaction = Transaction.new(options)
  end 

  def test_transaction_cost()
    assert_equal( 35.30, @transaction.cost() )
  end 

end 