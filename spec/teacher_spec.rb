require_relative '../teacher'

teacher = Teacher.new(45, 'Maths')

describe '#Review teacher Class' do
  it 'Return specialization' do
    expect(teacher.specialization).to eql 'Maths'
  end

  it 'Return Age' do
    expect(teacher.age).to eql 45
  end

  it 'Return Name' do
    expect(teacher.name).to eql 'Unknown'
  end

  it 'Return Type' do
    expect(teacher.type).to eql 'Teacher'
  end

  it 'Return result for can_use_services?' do
    expect(teacher.can_use_services?).to eql true
  end
end