require_relative 'person'

class Teacher < Person
  attr_reader :specialization

  def initialize(specialization, age, name = 'Unknown')
    super(age, name, true)
    @specialization = specialization
  end
end
