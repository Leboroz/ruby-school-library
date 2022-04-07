class Book
  attr_accessor :title, :author, :rentals, :id

  def initialize(title, author)
    @id = rand(10_000)
    @title = title
    @author = author
    @rentals = []
  end

  def add_rental(rental)
    @rentals.push(rental)
  end

  def to_s
    " - Title: #{title}, author: #{author}"
  end
end
