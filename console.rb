require_relative( 'models/customer')
require_relative( 'models/films')
require_relative( 'models/tickets')

require('pry-byebug')

Ticket.delete_all()
Customer.delete_all()
Film.delete_all()

customer1 = Customer.new({
  'name' => 'George',
  'funds' => '80'
  })
customer1.save()

customer2 = Customer.new({
  'name' => 'Julie',
  'fund' => '100'
  })

customer2.save()

customer3 = Customer.new({
  'name' => 'Jamie',
  'fund' => '10'
  })

customer3.save()


film1 = Film.new({
  'title' => 'Everest',
  'price' => '5'
  })
film1.save()

film2 = Film.new({
  'title' => 'Into the Wild',
  'price' => '5'
  })
film2.save()

  ticket1 = Ticket.new({
    'customer_id' => customer1.id,
    'film_id' => film1.id
    })

ticket1.save()

ticket2 = Ticket.new(
  'customer_id' => customer2.id,
  'film_id' => film2.id
)
ticket2.save()

ticket3 = Ticket.new(
  'customer_id' => customer3.id,
  'film_id' => film2.id
)
ticket3.save()




binding.pry

nil
