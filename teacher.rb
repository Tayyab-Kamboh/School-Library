require_relative 'person'

class Teacher < Person
  attr_reader :parent_permission, :specialization
  attr_accessor :rentals

  def initialize(age, name = 'unknown', parent_permission: true, specialization: nil)
    super(age, name)
    @parent_permission = parent_permission
    @specialization = specialization
    @rentals = []
  end

  def can_use_services?
    true
  end
end
