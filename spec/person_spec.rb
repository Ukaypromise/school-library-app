require './person'

person = Person.new(30, 'Addis')

describe '#Review Person Class' do
  it 'Returns Name' do
    expect(person.name).to eql 'Addis'
  end

  it 'Returns Age' do
    expect(person.age).to eql 30
  end

  it 'Return result for can_use_services?' do
    expect(person.can_use_services?).to eql true
  end

  it 'Return result for correct_name' do
    expect(person.correct_name).to eql 'Addis'
  end

  describe '#add_rentals method' do
    it 'add_rental' do
      expect(person.rentals).to eql []
    end
  end
end
