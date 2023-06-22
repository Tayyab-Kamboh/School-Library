require_relative 'person'

class Student < Person
  attr_reader :classroom, :parent_permission
  attr_accessor :name, :classroom # rubocop:todo Lint/DuplicateMethods

  def initialize(name) # rubocop:todo Lint/MissingSuper
    @name = name
    @classroom = nil
  end

  def initialize(age, name = 'unknown', parent_permission: true, classroom: nil) # rubocop:todo Lint/DuplicateMethods
    super(name, age, parent_permission: parent_permission)
    @classroom = classroom
  end

  def play_hooky
    '¯\(ツ)/¯'
  end
end
f
