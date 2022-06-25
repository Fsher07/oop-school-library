require './app'

class Main
  def initialize
    @action = App.new
  end

  def intro
    puts 'Welcome to Schoold Library App!'
    puts ''
  end

  def options
    puts "\nPlease choose an option by entering a number:\n"
    puts ['1 - List all books', '2 - List all people', '3 - Create a person', '4 - Create a book',
          '5 - Create a rental', '6 - List all rentals for a given person id', '7 - Exit']
    input = gets.chomp.to_i
    handle_option(input)
  end

  # rubocop:disable Metrics/CyclomaticComplexity
  def handle_option(input)
    case input
    when 1
      @action.list_book
    when 2
      @action.list_people
    when 3
      @action.add_person
    when 4
      @action.add_book
    when 5
      @action.creat_rental
    when 6
      @action.list_rentals
    when 7
      puts 'Thank you for using School Library App'
      exit
    else
      puts 'Please select an option'
    end
    options
  end

  # rubocop:enable Metrics/CyclomaticComplexity
  def run
    intro
    options
  end

  def main
    run
  end
end

Main.new.main
