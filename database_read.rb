require 'json'

module ReadDatabase
  def read_person
    if File.exist?('./JSON/people.json')
      persons = File.open('./JSON/people.json')
      data = persons.read
      JSON.parse(data)
    else
      File.write('./JSON/people.json', [])
    end
  end

  def read_book
    if File.exist?('./JSON/books.json')
      books = File.open('./JSON/books.json')
      data = books.read
      JSON.parse(data)
    else
      File.write('./JSON/books.json', [])
    end
  end

  def read_rentals
    if File.exist?('./JSON/rentals.json')
      rentals = File.open('./JSON/rentals.json')
      data = rentals.read
      JSON.parse(data)
    else
      File.write('./JSON/rentals.json', [])
    end
  end
end
