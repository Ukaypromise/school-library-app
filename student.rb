require_relative './person'

class Student < Person
  attr_reader :type #:classroom

  def initialize(age, classroom, name: 'Unknown', parent_permission: true, type: 'Student')
    super(age, name, parent_permission: parent_permission)
    @classroom = classroom
    @type = type
  end

  def play_hooky
    '¯\(ツ)/¯'
  end

  def classroom(classes)
    @classroom = classes
    classes.students.push(self) unless classes.students.include(self)
  end
end
