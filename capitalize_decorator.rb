require_relative "./nameable.rb"

class CapitalizeDecorator < Nameable
  def correct_name
    return @nameable.corret_name.capitalize
  end
end