require_relative "./decorator.rb"

class CapitalizeDecorator < Decorator
  def correct_name
    return @nameable.corret_name.capitalize
  end
end