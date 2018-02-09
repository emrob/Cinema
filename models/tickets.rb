require_relative("..db/sql_runner")

class Ticket

  attr_reader :id
  attr_accessor :customer_id, :film_id

def initialize(options)
  @customer_id = options['customer_id']
  @film_id = options['film_id']
  @id = options['id'].to_i if options ['id']
end

end
