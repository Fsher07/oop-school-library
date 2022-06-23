require './base_decorator.rb'
require './person.rb'

class CapitalizeDecorator < Decorator
  def correct_name
    @nameable.correct_name.capitalize
  end
end

person = Person.new(22, 'maximilianus')
capitalizedPerson = CapitalizeDecorator.new(person)
p capitalizedPerson.correct_name