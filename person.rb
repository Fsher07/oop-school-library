require './nameable'

class Person < Nameable
  def initialize(age, name = 'unknown', parent_permission: true)
    super()
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    rentals = []
  end

  attr_reader :id, :rentals

  attr_accessor :name, :age, :parent_permission

  def of_age?
    @age >= 18
  end

  private :of_age?

  def can_use_services?
    @age >= 18 || @parent_permission
  end

  def correct_name
    @name
  end
end