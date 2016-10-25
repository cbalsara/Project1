require_relative('../db/sql_runner')

class Transaction 

    attr_reader :id, :category_id, :merchant_id, :cost

  def initialize(options)
    @id = options['id'].to_i
    @category_id = options['category_id'].to_i
    @merchant_id = options['merchant_id'].to_i
    @cost = options['cost']
  end 

  def save()
    sql = "INSERT INTO transactions (category_id, merchant_id, cost) VALUES ('#{@category_id}', '#{@merchant_id}', '#{@cost}') RETURNING *"
    transaction = SqlRunner.run(sql).first
    @id = transaction['id'].to_i
  end 

  def category()
    sql = "SELECT * FROM categorys WHERE id = #{@category_id}"
    return Category.map_item(sql)
  end 

  def merchant()
    sql = "SELECT * FROM merchants WHERE id = #{@merchant_id}"
    return Merchant.map_item(sql)
  end 

  def self.all()
    sql = "SELECT * FROM transactions"
    return Transaction.map_items(sql)
  end 

  def self.delete_all()
    sql = "DELETE FROM transactions"
    SqlRunner.run(sql)
  end 

  def update
    sql = "UPDATE transactions SET 
      category_id = '#{ @category_id }',
      merchant_id = '#{ @merchant_id}',
      cost = '#{@cost}',
      WHERE id = #{@id};"
    SqlRunner.run(sql)
    return nil
  end

  def self.find(id)
    sql = "SELECT * FROM transactions WHERE id = #{id}"
    return Transaction.map_item(sql)
  end 

  def self.map_items(sql)
    transactions = SqlRunner.run(sql)
    result = transactions.map{ |transaction| Transaction.new(transaction)}
    return result 
  end 

  def self.map_item(sql)
    result = Transaction.map_items(sql)
    return result.first
  end
end 