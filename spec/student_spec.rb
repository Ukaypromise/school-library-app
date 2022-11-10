require './student'

student = Student.new(12, 'A', name: 'John', parent_permission: true)
student_b = Student.new(12, 'A')
describe 'Student' do
    it 'Should have a classroom' do
        expect(student.classroom).to eql('A')
    end
    
    it 'Should have a type' do
        expect(student.type).to eql('Student')
    end
    
    it 'Should have a play_hookey method' do
        expect(student.play_hookey).to eql('¯(ツ)/¯')
    end

    it 'Should return name Unknown if no name is given' do
        expect(student_b.name).to eql('Unknown')
    end

end