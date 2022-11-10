require './student'
require './classroom'

classroom = Classroom.new('A')
student = Student.new(25, 'A')

describe '#Review classroom file' do
  it 'Return the Classroom' do
    expect(classroom.label).to eql 'A'
  end

  it 'Return the answer to the function add_student' do
    expect(classroom.add_student(student)).to eql classroom
  end
end
