require './teacher.rb'
require './student.rb'
require './book.rb'
require './rental'

class App
  def initialize
    @books = []
    @people = []
    @rentals = []
  end

  def list_books
    if @books.empty?
      puts "There are currently no books in the library.\n"
    else books.each { |book| puts `Title: #{book.title}, Author: #{book.author}` }
    end
  end

  def list_people
    if @people.empty?
      puts "There are currently no registered person in the library.\n"
    else 
      @people.each do |person|
        if person.is_a?(Student)
        puts "[Student] ID: #{person.id}, Name: #{person.name}, Age: #{person.age}, parent permission: #{person.parent_permission ? 'Yes' : 'No'}"
        else
          puts "[Teacher] ID: #{person.id}, Name: #{person.name}, Age: #{person.age} "
        end
      end
    end
  end

  def add_person
    print 'Do you want to create a student(1) or a teacher(2)? [Input the number]:'
    input_number = gets.chomp.to_i
    case input_number
    when 1
      print 'Age:'
      age = gets.chomp
      print 'Name:'
      name = gets.chomp
      add_student(age, name)
    when 2
      print 'Age:'
      age = gets.chomp
      print 'Name:'
      name = gets.chomp
      add_teacher(age, name)
    end
  end

  def add_student(age, name)
    print 'Has parent permission? [y/n]:'
    permission = gets.chomp
    case permission
    when 'y'
      student = Student.new(age, name)
    when 'n'
    student = Student.new(age, name, parent_permission: false)
    puts 'Person created successfully'
    end
    @people << student
  end

  def add_teacher(age, name)
    print 'Specialization:'
    specialization = gets.chomp
    teacher = Teacher.new(age, specialization, name)
    puts 'Person created successfully'
    @people << teacher
  end
end