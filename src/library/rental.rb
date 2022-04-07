class Rental
  attr_accessor :date, :book, :person

  def initialize(date, book, person)
    person.rentals << self
    @person = person
    book.rentals << self
    @book = book
    @date = date
  end

  def to_s
    "Rental: book: #{book.title} belongs to #{person.name} until #{date}"
  end
end
