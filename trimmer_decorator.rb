require_relative "./nameable.rb"

class TrimmerDecorator < Nameable
  def correct_name
    if @nameable.correct_name.length > 10
      trimmed_name = @nameable.correct_name[0...10]
    end
    return trimmed_name
  end
end