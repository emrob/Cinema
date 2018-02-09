require_relative( 'models/customer')
require_relative( 'models/films')
require_relative( 'models/tickets')

require('pry-byebug')

customer1 = Customer.new({
  'name' => 'George',
  'funds' => '80'
  })
customer1.save()



binding.pry

nil
