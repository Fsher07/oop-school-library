require './person'

class Student < Person

  def initialize(name = "unknown", classroom, age, parent_permission: true)
    super(name, age, parent_permission)
    @classroom = classroom
  end

  def play_hooky
    "¯\(ツ)/¯"
  end

end

dog = Student.new('kral', 1)