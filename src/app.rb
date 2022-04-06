require_relative "library/book"
require_relative "library/rental"
require_relative "people/school/student"
require_relative "people/school/teacher"
require "date"
require "yaml"

class App
  MENU = "1 - List all books.
2 - List all people.
3 - Create a person.
4 - Create a book.
5 - Create a rental.
6 - List all rentals for a given person id.
7 - Quit"
  @@books = []
  @@people = []
  @@rentals = []
  @@date = Time.new.strftime("%Y-%m-%d")

  def self.run
    print "Select an option(number) to continue.\n"

    while true
      clear
      print "#{MENU}\n"
      print "Option: "

      case gets.chomp

      when '1'
        print_list("books")
      when '2'
        print_list("people")
      when '3'
        puts "Press 1 for student or 2 for teacher"
        print "Option: "
        case gets.chomp
        when "1"
          create_person { |a, n|
            puts "Input permition yes(1) or no(2)"
            print "permition: "
            permit = gets.chomp
            Student.new(a, n, parent_permition: permit == "1")
          }
        when "2"
          create_person { |a, n|
            puts "Input specialization"
            print "Specialization: "
            specialization = gets.chomp
            Teacher.new(specialization, a, n)
          }
        end
      when '4'
        puts "Input title and author"
        print "Title: "
        title = gets.chomp
        puts " "
        print "Author: "
        author = gets.chomp
        current = @@books.length
        create_book(title, author)
        puts current < @@books.length ? "Book added" : "Error"
      when '5'
        create_rental
      when '6'
        puts "Select a person by id"
        print_list("people")
        print "Input Id: "
        person_id = Integer(gets.chomp)
        print_rental_by_person_id(person_id)
      when '7'
        clear
        break
      end
      puts ""
      puts "Press enter to continue"
      gets.chomp
    end
  end

  private

  def self.create_book(title, author)
    @@books.push(Book.new(title, author))
  end

  def self.print_list(item)
    list = item == "books" ? @@books : @@people
    puts "These are the #{item} stored: ", list.map { |obj| "#{obj.to_yaml.sub(/---( &\d*)? !ruby\/object:/, '')}\n"} unless list.empty?
    puts "There are no #{item}" if list.empty?
  end

  def self.create_person
          puts "Input name"
          print "Name: "
          name = gets.chomp
          puts "Input age"
          print "Age: "
          age = Integer(gets.chomp)
    @@people.push(yield(age, name))
  end

  def self.clear
      system "clear"
      system "cls"
  end

  def self.print_rental_by_person_id(id)
    @@people.select { |person| person.id == id}.each { |person| person.rentals.each { |rental| puts rental.to_yaml.sub(/---( &\d*)? !ruby\/object:/, '')}}[0]
  end

  def self.create_rental
    puts "Choose person by ID"
    print_list("people")
    print "Input id: "
    person_id = Integer(gets.chomp)
    puts "Choose book by ID"
    print_list("books")
    print "Input id: "
    book_id = Integer(gets.chomp)
    @@rentals.push(Rental.new(@@date, @@books.select { |book| book.id == book_id }[0], @@people.select { |person| person.id == person_id }[0]))
  end
end

def main
  App::run
end

main
