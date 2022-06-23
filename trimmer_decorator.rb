require './base_decorator.rb'
require './person.rb'
require './capitalize_decorator.rb'

class TrimmerDecorator < Decorator
  def correct_name
    @nameable.correct_name.slice(0...10)
  end
end

