require_relative("../db/sql_runner")

class Customer

  attr_reader :id
  attr_accessor :name, :funds

  def initialize(options)
    @name = options['name']
    @funds = options['funds'].to_i
    @id = options['id'].to_i if options ['id']
  end

  def save()
    sql = "INSERT INTO customers (name, funds) VALUES ($1, $2) RETURNING id"
    values = [@name, @funds]
    customers = SqlRunner.run(sql,values).first
    @id = customers['id'].to_i
  end

  def films()
    sql = "SELECT films.* FROM films INNER JOIN tickets ON films.id = tickets.film_id WHERE tickets.customer_id = $1 "
    values = [@id]
    films = SqlRunner.run(sql, values).first
    return films.map {|film| Film.new(films)}

  end

  def self.delete_all()
    sql = "DELETE FROM customers"
    values = []
    SqlRunner.run(sql,values)

  end

  def self.all()
    sql = "SELECT * FROM customers"
    values = []
    customers = SqlRunner.run(sql, values)
    results = customers.map { |customer| Customer.new(customers)}

  end

  def update()
    sql = "UPDATE customers SET (name, funds) = ($1, $2) WHERE id = $3"
    values = [@name, @funds, @id]
    customer = SqlRunner.run(sql,values).first
  end

  def buy_ticket(screening)
    film = screening.film
    price = film.price
    Ticket.new('customer_id' => @id, 'film_id' => screening.film)
    @funds -= film.price

  end



  def ticket_sale()
    sql = "UPDATE customers SET funds = $1 WHERE id = $3"
    values = [@funds]
    @id = customer['id'].to_i
    ticket_sale = SqlRunner.run(sql,values).first
    return @funds -= 20
  end




end
