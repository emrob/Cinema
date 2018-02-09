require_relative("../db/sql_runner")

class Film
  attr_reader :id
  attr_accessor :title, :price

  def initialize(options)
    @title = options['title']
    @price = optioons['price'].to_i
    @id = options['id'].to_i if ['id']

  end

end
