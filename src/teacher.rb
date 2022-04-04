require_relative "person"

class Teacher < Person
  attr_reader :specialization
  def initialize(name = "Unknown", age, specialization)
    super(name, true, age)
    @specialization = specialization
  end
end
