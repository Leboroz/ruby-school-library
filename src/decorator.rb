require_relative "nameable"

class Decorator 
  attr_accessor :nameable

  def initialize(nameable)
    @nameable = nameable
  end
  
  def correct_name
    @nameable.correct_name
  end
end

class CapitalizeDecorator < Decorator
  def correct_name
    @nameable.correct_name.capitalize
  end
end

class TrimmerDecorator < Decorator
  def correct_name 
    @nameable.correct_name[0,9]
  end
end
