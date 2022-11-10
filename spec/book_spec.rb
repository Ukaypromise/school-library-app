require_relative '../book'

book = Book.new('Ruby', 'Promise')

describe '#Check the Book Class' do
  it 'returns the correct title' do
    expect(book.title).to eql 'Ruby'
  end

  it 'returns the correct author' do
    expect(book.author).to eql 'Promise'
  end
end
