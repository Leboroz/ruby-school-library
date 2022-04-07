require_relative 'utils/nameable'
require_relative 'utils/decorator'
# Public: Various methods useful for performing checking on people in a library.
class Person < Nameable
  # Public: Gets/Sets the String name or age of the person.
  attr_accessor :name, :age, :rentals

  # Public: Returns the Integer age of the person.
  attr_reader :id

  # Public: initialize a person.
  #
  # id - An Integer randomly generated.
  # name - A String naming the person.
  # age - An Integer that describes the person's age.
  # parent_permition - A Boolean that describes parent permition status.
  def initialize(age, name = 'Unknown', parent_permition: true)
    super()
    @id = rand(10_000)
    @name = name
    @age = age
    @parent_permition = parent_permition
    @rentals = []
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

  def to_s 
    "id: #{id}, name: #{name}, age: #{age}" 
  end

  private

  # Internal: This method shows false if the person is under age
  #
  # Returns true if age is greater than or equals to 18
  def of_age?
    @age >= 18
  end
end
