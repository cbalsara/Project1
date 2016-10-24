require_relative('../db/sql_runner')

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

  def self.all()
    sql = "SELECT * FROM categorys"
    return Category.map_items(sql)
  end 

  def self.map_items(sql)
    categorys = SqlRunner.run(sql)
    result = categorys.map{ |category| Category.new(category)}
    return result 
  end 

  def self.map_item(sql)
    result = category.map_items(sql)
    return result.first
  end
end 