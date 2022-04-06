require_relative 'library/book'
require_relative 'library/rental'
require_relative 'people/school/student'
require_relative 'people/school/teacher'
require 'date'
require 'yaml'

class App
  MENU = "1 - List all books.
2 - List all people.
3 - Create a person.
4 - Create a book.
5 - Create a rental.
6 - List all rentals for a given person id.
7 - Quit".freeze
  def initialize
    @books = []
    @people = []
    @rentals = []
    @date = Time.new.strftime('%Y-%m-%d')
  end

  def run
    print "Select an option(number) to continue.\n"

    loop do
      clear
      print "#{MENU}\n"
      print 'Option: '
      opt = gets.chomp
      case opt
      when '1', '2' then print_list(opt)
      when '3' then create_person_input
      when '4' then create_book
      when '5' then create_rental
      when '6' then print_rental_by_person_id
      when '7'
        clear
        break
      end
      puts ''
      puts 'Press enter to continue'
      gets.chomp
    end
  end

  def create_book
    puts 'Input title and author'
    print 'Title: '
    title = gets.chomp
    puts ' '
    print 'Author: '
    author = gets.chomp
    current = @books.length
    @books.push(Book.new(title, author))
    puts current < @books.length ? 'Book added' : 'Error'
  end

  def create_person_input
    puts 'Press 1 for student or 2 for teacher'
    print 'Option: '
    case gets.chomp
    when '1'
      create_person do |a, n|
        puts 'Input permition yes(1) or no(2)'
        print 'permition: '
        permit = gets.chomp
        Student.new(a, n, parent_permition: permit == '1')
      end
    when '2'
      create_person do |a, n|
        puts 'Input specialization'
        print 'Specialization: '
        specialization = gets.chomp
        Teacher.new(specialization, a, n)
      end
    end
  end

  def print_list(item)
    options = { '1' => 'books', '2' => 'people' }
    item = options[item]
    list = item == 'books' ? @books : @people
    unless list.empty?
      puts "These are the #{item} stored: "
      list.each_with_index do |obj, index|
        puts "index: #{index} - #{obj.to_yaml.sub(%r{---( &\d*)? !ruby/object:}, '')}\n"
      end
    end
    puts "There are no #{item}" if list.empty?
  end

  def create_person
    puts 'Input name'
    print 'Name: '
    name = gets.chomp
    puts 'Input age'
    print 'Age: '
    age = Integer(gets.chomp)
    @people.push(yield(age, name))
  end

  def clear
    system 'clear'
    system 'cls'
  end

  def print_rental_by_person_id
    puts 'Select a person by index'
    print_list('people')
    print 'Input Index: '
    index = Integer(gets.chomp)
    clear
    @people[index].rentals.each do |rental|
      puts rental.to_yaml.sub(%r{---( &\d*)? !ruby/object:}, '')
    end
  end

  def create_rental
    puts 'Choose person by Index'
    print_list('2')
    print 'Input Index: '
    person_index = Integer(gets.chomp)
    puts '******************************'
    puts 'Choose book by Index'
    print_list('1')
    print 'Input Index: '
    book_index = Integer(gets.chomp)
    @rentals.push(Rental.new(
                    @date,
                    @books[book_index],
                    @people[person_index]
                  ))
  end
end

def main
  app = App.new
  app.run
end

main
