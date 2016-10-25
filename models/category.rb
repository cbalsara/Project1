require_relative('../db/sql_runner')
require('pry-byebug')

class Category

    attr_reader :id, :type

  def initialize(options)
    @id = options['id'].to_i
    @type = options['type']
  end 

  def save()
    sql = "INSERT INTO categorys (type) VALUES ('#{@type}') RETURNING *"
    category = SqlRunner.run(sql).first
    @id = category['id'].to_i
  end 

  def self.delete_all()
    sql = "DELETE FROM categorys"
    SqlRunner.run(sql)
  end 

  def specific_total()
    sql = " SELECT SUM(cost) FROM transactions WHERE category_id = #{@id} "
    total = SqlRunner.run(sql).first
    # binding.pry
        return total['sum'].to_f
  end 

  def self.all()
    sql = "SELECT * FROM categorys"
    return Category.map_items(sql)
  end 

  def self.find(id)
    sql = "SELECT * FROM categorys WHERE id = #{id}"
    return Category.map_item(sql)
  end 

  def self.map_items(sql)
    categorys = SqlRunner.run(sql)
    result = categorys.map{ |category| Category.new(category)}
    return result 
  end 

  def update
    sql = "UPDATE categorys SET 
      type = '#{ @type }',
      WHERE id = #{@id};"
    SqlRunner.run(sql)
    return nil
  end
  # to get back all the different merchants who hold a specifically chosen item 
  # def merchants
  #   sql = "SELECT merchants.* FROM merchants INNER JOIN transactions ON transactions.merchant_id = merchants.id WHERE transactions.category_id = #{@id};" 
  #     return Merchant.map_items(sql)
  # end 

  def transactions
    sql = "SELECT * FROM transactions WHERE category_id = #{@id}"
    result = Transaction.map_items(sql)
    return result    
  end 
 
  def self.map_item(sql)
    result = Category.map_items(sql)
    return result.first
  end
end 