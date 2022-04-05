class Rental
  attr_accessor :date

  def initialize(date, book, person)
    @person = person
    @book = book
    @date = date
  end
end
