require_relative 'person'

# Public: Subclass of person. Creates an instance of student.
class Student < Person
  # Public: initialize a student.
  #
  # id - An Integer randomly generated.
  # name - A String naming the student.
  # age - An Integer that describes the student's age.
  # student - A String naming the student's classroom.
  def initialize(classroom, age, name = 'Unknown', parent_permission: true)
    super(age, name, parent_permission)
    @classroom = classroom
    of_age?
  end

  # Public: ¯\(ツ)/¯
  #
  # Returns ¯\(ツ)/¯
  def play_hooky
    "¯\(ツ)/¯"
  end
end
