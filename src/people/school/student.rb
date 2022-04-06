require_relative '../person'

# Public: Subclass of person. Creates an instance of student.
class Student < Person
  attr_accessor :classroom

  # Public: initialize a student.
  #
  # id - An Integer randomly generated.
  # name - A String naming the student.
  # age - An Integer that describes the student's age.
  # student - A String naming the student's classroom.
  def initialize(age, name = 'Unknown', parent_permition: true)
    super(age, name, parent_permition: parent_permition)
    @classroom = 'Not assigned'
    of_age?
  end

  # Public: ¯\(ツ)/¯
  #
  # Returns ¯\(ツ)/¯
  def play_hooky
    "¯\(ツ)/¯"
  end

  def belongs_to(classroom)
    @classroom = classroom if @classroom == 'Not assigned'
    classroom.add_student(self) unless classroom.students.index(self)
  end
end
