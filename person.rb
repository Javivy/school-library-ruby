require './nameable'

class Person < Nameable
  attr_accessor :name, :age
  attr_reader :id, :rentals

  def initialize(age, name: 'Unknown', parent_permission: false)
    super()
    @name = name
    @age = age
    @parent_permission = parent_permission
    @id = Random.rand(1..1000)
    @rentals = []
  end

  def can_use_services?
    if of_age?
      true
    else
      @parent_permission ? true : false
    end
  end

  def correct_name
    @name
  end

  def add_rental(rental)
    @rentals.push(rental)
    rental.person = self
  end

  private

  def of_age?
    @age >= 18
  end
end
