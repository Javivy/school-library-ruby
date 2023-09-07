require_relative "./nameable.rb"

class Decorator
  def initialize(nameable)
    @nameable = nameable
  end

  def correct_name
    return @nameable.correct_name
  end
end