require_relative 'nameable'
# Public: Base decorator for the nameable class.
class Decorator < Nameable
  attr_accessor :nameable

  # Public: Initialize a Decorator base class.
  #
  # nameable - A Nameable subclass that will be stored into @nameable
  def initialize(nameable)
    super
    @nameable = nameable
  end

  # Public: calls nameable.correct_name from subclass
  def correct_name
    @nameable.correct_name
  end
end

# Public: Decorator that contains a method to alters the name string from nameable
class CapitalizeDecorator < Decorator
  # Public: Capitalizes the name String from nameable
  def correct_name
    @nameable.correct_name.capitalize
  end
end

# Public: Decorator that contains a method to alters the name string from nameable
class TrimmerDecorator < Decorator
  # Public: Makes sure that the output of @nameable.correct_name has a
  # maximum of 10 characters. If it's longer it should trim the word.
  def correct_name
    name = @nameable.correct_name
    name.length > 10 ? name[0, 9] : name
  end
end
