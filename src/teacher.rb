require_relative 'person'

# Public: Subclass of person. Creates an instance of teacher.
class Teacher < Person
  attr_reader :specialization

  # Public: initialize a teacher.
  #
  # id - An Integer randomly generated.
  # name - A String naming the teacher.
  # age - An Integer that describes the teacher's age.
  # specialization - A String naming the teacher's specialization.
  def initialize(specialization, age, name = 'Unknown')
    super(age, name, true)
    @specialization = specialization
  end
end
