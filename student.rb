require_relative 'person'

class Student < Person
  attr_reader :classroom, :parent_permission
  attr_accessor :name, :rentals

  def initialize(name, age, parent_permission: true, classroom: nil)
    super(name, age, parent_permission:)
    self.classroom = classroom
    @rentals = []
  end

  def classroom=(classroom)
    return if classroom == @classroom

    @classroom&.remove_student(self)

    @classroom = classroom

    return unless @classroom

    @classroom.add_student(self)
  end

  def play_hooky
    '¯\(ツ)/¯'
  end
end
