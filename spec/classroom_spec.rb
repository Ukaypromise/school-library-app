# require './classroom'
# require './student'

# classroom = Classroom.new('A')

# describe 'Classroom' do
#     it 'Should have a label' do
#         expect(classroom.label).to eql('A')
#     end
#     it 'Should have a students' do
#         expect(classroom.students).to eql([])
#     end
#     it 'Should have a add_student method' do
#         new_student = classroom.add_student('John')
#         expect(new_student).to eql(['john'])
#     end
# end

require './student'
require './classroom'
require './book'
require './rentals'
require 'json'

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
