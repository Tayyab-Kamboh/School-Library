require_relative 'person'

class Student < Person
  attr_reader :classroom, :parent_permission
  attr_accessor :name

  def initialize(name, age, parent_permission: true, classroom: nil)
    super(name, age, parent_permission: parent_permission)
    self.classroom = classroom
  end

  def classroom=(classroom)
    @classroom&.remove_student(self)
    @classroom = classroom
    classroom&.add_student(self)
  end

  def play_hooky
    '¯\(ツ)/¯'
  end
end
