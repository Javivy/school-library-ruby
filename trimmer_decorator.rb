require_relative "./decorator.rb"

class TrimmerDecorator < Decorator
  def correct_name
    return @nameable.correct_name[0...10]
  end
end