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
    sql = "UPDATE customers SET name = $1 WHERE id = $3"
    values = [@name]
    @id = customer[id].to_i
    customer = SqlRunner.run(sql,values).first
    return customer.map {|customer| Customer.new(customer)}
  end

  # def ticket_sale()
  #   sql = "UPDATE customers SET funds = $1 WHERE id = $3"
  #   values = [@funds]
  #   ticket_sale = SqlRunner.run(sql,values).first
  #   return ticket_sale[@funds] -= 20
  #   # ticket_sale = []
  #   # if ticket_sale.count !nil
  #   #   return
  #   #   @funds -= 20
  #   # end
  # end





end
