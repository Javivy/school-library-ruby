class Person
  attr_accessor :name, :age
  attr_reader :id

  def initialize(age, name = "Unknown", parent_permission = false)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @id = Random.rand(1..1000)
  end

  def can_use_services?
    return of_age?() ? true : @parent_permission ? true : false
  end

  private

  def of_age?
    return @age >= 18 ? true : false
  end
end