require_relative('../db/sql_runner')

class Merchant 

    attr_reader :id, :name

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
  end 

  def save()
    sql = "INSERT INTO merchants (name) VALUES ('#{@name}') RETURNING *"
    merchant = SqlRunner.run(sql).first
    @id = merchant['id'].to_i
  end 

  def self.delete_all()
    sql = "DELETE FROM merchants"
    SqlRunner.run(sql)
  end 

  def self.all()
    sql = "SELECT * FROM merchants"
    return Merchant.map_items(sql)
  end 

  def self.find(id)
    sql = "SELECT * FROM merchants WHERE id = #{id}"
    return Merchant.map_item(sql)
  end 

  def self.map_items(sql)
    merchants = SqlRunner.run(sql)
    result = merchants.map{ |merchant| Merchant.new(merchant)}
    return result 
  end 

  def self.map_item(sql)
    result = merchant.map_items(sql)
    return result.first
  end
end 