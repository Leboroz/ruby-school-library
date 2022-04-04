require_relative "nameable"
require_relative "decorator"
# Public: Various methods useful for performing checking on people in a library.
class Person < Nameable
  # Public: Gets/Sets the String name or age of the person.
  attr_accessor :name, :age

  # Public: Returns the Integer age of the person.
  attr_reader :id

  # Public: initialize a person.
  #
  # id - An Integer randomly generated.
  # name - A String naming the person.
  # age - An Integer that describes the person's age.
  # parent_permition - A Boolean that describes parent permition status.
  def initialize(age, name = 'Unknown', parent_permition: true)
    @id = rand(10_000)
    @name = name
    @age = age
    @parent_permition = parent_permition
  end

  def correct_name
    @name
  end

  # Public: This method describes the person's permittion status to use the services
  #
  # Returns true if the person is not under age or it has parent_permition
  def can_use_services?
    of_age? || @parent_permition
  end

  private

  # Internal: This method shows false if the person is under age
  #
  # Returns true if age is greater than or equals to 18
  def of_age?
    @age >= 18
  end
end
person = Person.new(22, 'maximilianus')
  person.correct_name
  capitalizedPerson = CapitalizeDecorator.new(person)
p  capitalizedPerson.correct_name
  capitalizedTrimmedPerson = TrimmerDecorator.new(capitalizedPerson)
p  capitalizedTrimmedPerson.correct_name
