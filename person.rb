class Person
  
  def initialize(name = "unknown", age, parent_permission: true)
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  def id
    @id
  end

  attr_accessor :name, :age

  attr_reader :id

  def is_of_age?
    @age >= 18
  end

  private :is_of_age?

  def can_use_services?
    @age >= 18 || @parent_permission
  end

end