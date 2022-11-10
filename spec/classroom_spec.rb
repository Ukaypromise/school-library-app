require './classroom'

classroom = Classroom.new('A')

describe 'Classroom' do
    it 'Should have a label' do
        expect(classroom.label).to eql('A')
    end
    it 'Should have a students' do
        expect(classroom.students).to eql([])
    end
    it 'Should have a add_student method' do
        new_student = classroom.add_student('John')
        expect(new_student).to eql(['john'])
    end
end