require_relative './person'

class Teacher < Person
  attr_reader :specialization, :type

  def initialize(age, specialization, name: 'Unknown', type: 'Teacher')
    super(age, name)
    @specialization = specialization
    @type = type
  end

  def can_use_services?
    true
  end
end
