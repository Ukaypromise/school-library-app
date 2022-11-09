require 'json'

module Database
  def write_person(person)
    File.write('./JSON/people.json', JSON.pretty_generate(person))
  end

  def write_book(book)
    File.write('./JSON/books.json', JSON.pretty_generate(book))
  end

  def write_rental(rental)
    File.write('./JSON/rentals.json', JSON.pretty_generate(rental))
  end
end