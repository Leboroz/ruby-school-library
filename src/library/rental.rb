class Rental
  attr_accessor :date, :book, :person

  def initialize(date, book, person)
    person.rentals << self
    @person = person
    book.rentals << self
    @book = book
    @date = date
  end
end
