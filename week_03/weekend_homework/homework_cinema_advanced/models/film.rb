require_relative('../db/sql_runner')

class Film

  attr_reader :id, :title, :price, :empty_seats

  def initialize(options)
    @id = options['id'].to_i
    @title = options['title']
    @price = options['price'].to_f
  end

  def save()
    sql = "INSERT INTO films (title, price) VALUES ('#{@title}', #{@price}) RETURNING *"
    film = SqlRunner.run(sql).first
    @id = film['id'].to_i
  end

  def update()
    sql = "UPDATE films SET (title, price) = ('#{@title}', #{@price}) WHERE id = #{@id}"
    SqlRunner.run(sql)
  end

  def customers()
    sql = "SELECT customers.* FROM customers INNER JOIN tickets ON tickets.customer_id = customers.id WHERE tickets.film_id = #{@id}"
    customers = Customer.map_items(sql)
    return customers
  end

  def number_of_viewers()
    return customers.count
  end 

  def self.all()
    sql = "SELECT * FROM films"
    return Film.map_items(sql)
  end

  def self.delete_all()
    sql = "DELETE FROM films"
    SqlRunner.run(sql)
  end

  def self.most_viewers()
    ordered = Film.all.sort! { |film1,film2| film1.number_of_viewers <=> film2.number_of_viewers }
    return ordered.first
  end


  #Helper methods for mapping
  def self.map_items(sql)
    films = SqlRunner.run(sql)
    result = films.map { |film| Film.new( film ) }
    return result
  end

  def self.map_item(sql)
    result = Film.map_items(sql)
    return result.first
  end

end