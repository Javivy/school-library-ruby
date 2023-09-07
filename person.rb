require_relative "./nameable.rb"

class Person < Nameable
  attr_accessor :name, :age
  attr_reader :id

  def initialize(age, name = 'Unknown', parent_permission: false)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @id = Random.rand(1..1000)
  end

  def can_use_services?
    if of_age?
      true
    else
      @parent_permission ? true : false
    end
  end

  private

  def of_age?
    @age >= 18
  end
end
