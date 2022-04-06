class Book
  attr_accessor :title, :author, :rentals, :id

  def initialize(title, author)
    @id = rand(10000)
    @title = title
    @author = author
    @rentals = []
  end

  def add_rental(rental)
    @rentals.push(rental)
  end
end
