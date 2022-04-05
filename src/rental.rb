class Rental
  attr_accessor :date

  def initialize(date, book, person)
    person.rentals << self
    @person = person
    book.rentals << self
    @book = book
    @date = date
  end
end
