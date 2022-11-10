

require '../person'
require '../book'
require '../rentals'

describe 'Test rental class implementation' do
  before(:each) do
    @book = Book.new('Gamers', 'Addis')
    @person = Person.new('Promise', 30)
    @rentals = Rental.new('22/01/2020', @person, @book)
  end

  it 'date of rental implementation' do
    expect(@rentals.date).to eql '22/01/2020'
  end
end