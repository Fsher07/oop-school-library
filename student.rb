require './person'
require './classroom'

class Student < Person
  attr_accessor :classroom, :name, :age

  def initialize(age, name = 'unknown')
    super(age, name)
    @classroom = classroom
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end

  def play_hooky
    "¯\(ツ)/¯"
  end
end