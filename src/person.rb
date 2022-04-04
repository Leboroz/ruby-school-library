class Person
  attr_accessor :name, :age
  attr_reader :id

  def initialize(name = "Unknown", parent_permition = true, age)
    @id = rand(10000)
    @name = name
    @age = age
    @parent_permition = parent_permition
  end

  def can_use_services?
    self.is_of_age? || @parent_permition
  end

  private

  def is_of_age?
    @age > 18
  end
end

