class Person
  attr_accessor :name, :age
  attr_reader :id

  def initialize(age, name = 'Unknown', parent_permition: true)
    @id = rand(10_000)
    @name = name
    @age = age
    @parent_permition = parent_permition
  end

  def can_use_services?
    of_age? || @parent_permition
  end

  private

  def of_age?
    @age > 18
  end
end
