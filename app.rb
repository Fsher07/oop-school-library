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
      Main.new.options
    else 
      @books.each_with_index { |book, idx| puts "#{idx}) Title: '#{book.title}', Author: #{book.author}" }
    end
  end

  def list_people
    if @people.empty?
      puts "There are currently no registered person in the library.\n"
    else 
      @people.each_with_index do |person, idx|
        if person.is_a?(Student)
        puts "#{idx}) [Student] ID: #{person.id}, Name: #{person.name}, Age: #{person.age}, parent permission: #{person.parent_permission ? 'Yes' : 'No'}"
        else
          puts "#{idx}) [Teacher] ID: #{person.id}, Name: #{person.name}, Age: #{person.age} "
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

  def add_book
    print 'Title:'
    title = gets.chomp
    print 'Author:'
    author = gets.chomp
    book = Book.new(title, author)
    puts 'Book created successfully'
    @books << book
  end

  def creat_rental
    puts 'select book'
    list_books
    index_book = gets.chomp.to_i
    puts 'select person'
    list_people
    index_person = gets.chomp.to_i
    print 'date:'
    date = gets.chomp
    rental = Rental.new(date, @books[index_book], @people[index_person])
    @rentals << rental
    puts 'Rental created successfully'
  end

  def list_rentals
    print 'ID of person:'
    input_id = gets.chomp.to_i
    if @rentals.empty?
      puts "There are currently no rentals in the library.\n"
      Main.new.options
    else
      @rentals.each { |rental| puts "Date: #{rental.date}, Book: '#{rental.book.title}' by #{rental.book.author}" if rental.person.id == input_id}
    end
  end
end