require_relative("../db/sql_runner")


class Ticket

  attr_reader :id
  attr_accessor :customer_id, :film_id

def initialize(options)
  @customer_id = options['customer_id']
  @film_id = options['film_id']
  @id = options['id'].to_i if options ['id']
end

def save()
  sql = "INSERT INTO tickets (customer_id, film_id) VALUES ($1, $2) RETURNING id"
  values = [@customer_id, @film_id]
  tickets = SqlRunner.run(sql, values).first
  return tickets[id].to_i
end


def self.delete_all()
  sql = "DELETE FROM tickets"
  values = []
  SqlRunner.run(sql,values)

end

end
