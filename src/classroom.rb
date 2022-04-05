require_relative 'student'
require 'yaml'

class Classroom
  attr_accessor :label, :students

  def initialize(label)
    @label = label
    @students = []
  end

  def add_student(student)
    @students.push(student) unless @students.index(student)
    student.belongs_to(self) if student.classroom == 'Not assigned'
  end
end
