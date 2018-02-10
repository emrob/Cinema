require_relative("../db/sql_runner")


class Ticket

  attr_reader :id
  attr_accessor :customer_id, :film_id

def initialize(options)
  @customer_id = options['customer_id'].to_i
  @film_id = options['film_id'].to_i
  @id = options['id'].to_i if options['id']
end

def save()
  sql = "INSERT INTO tickets (customer_id, film_id) VALUES ($1, $2) RETURNING id"
  values = [@customer_id, @film_id]
  ticket = SqlRunner.run(sql, values).first
  @id = ticket['id'].to_i
end


def self.delete_all()
  sql = "DELETE FROM tickets"
  values = []
  SqlRunner.run(sql,values)

end

def self.all()
  sql = "SELECT * FROM tickets"
  tickets = SqlRunner.run(sql)
  result = tickets.map {|ticket| Tickets.new(ticket)}
  return result
end

# def customer()
#   sql = "SELECT * FROM customers INNER JOIN tickets ON customer.id = tickets.customer_id WHERE tickets.ticket_id = $1"
#   values = [@id]
#   customer = SqlRunner.run(sql, values)
#   return customer.map {|customer| Customer.new(customer)}
#
# end





end
