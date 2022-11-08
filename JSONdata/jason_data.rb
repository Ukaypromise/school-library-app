require 'json'

module HandleFile
    # WRITE TO FILE
  def write_json(array, file_path)
    opts = {
      array_nl: "\n",
      object_nl: "\n",
      indent: '  ',
      space_before: ' ',
      space: ' '
    }
    File.write(file_path, JSON.generate(array, opts))
  end
  # Read from file and checks if file exists
  def read_json(file_path)
    return unless File.exist?(file_path)

    file = File.read(file_path)
    JSON.parse(file)
  end

  # Store Books in Json file
  def store_books
    array = []
    @books.each do |book|
      array.push({
        title: book.title,
        author: book.author})
    end
    write_json(array, 'JSONdata/books.json')
  end

  # Read books from stored books file
  def read_books
    parse_file = read_json('JSONdata/books.json')
    parse_file.map do |book|
      @books.push(Book.new(book['title'], book['author']))
    end
  end

  # Store People in Json file
  def store_people
    array = []
    @people.map do |person|
      if person.instance_of? Student
        array.push({
          id:person.id,
          type:person.class,
          name: person.name,
          age: person.age,
          parent_permission: person.parent_permission,
          class_room: person.class_room })
      else
        array.push({
          id:person.id,
          type:person.class,
          name: person.name,
          age: person.age,
          specialization: person.specialization })
      end
    end
    write_json(array, 'JSONdata/people.json')
  end

  # Read people from stored people file
  def read_people
    parse_file = read_json('JSONdata/people.json')
    parse_file.map do |person|
      if person['type'] == 'Teacher'
        teacher = Teacher.new(person['specialization'], person['age'], name: person['name'])
        teacher.id = person['id']
        @people.push(teacher)
      else
        student = Student.new(person['class_room'], person['age'], person['name'], parent_permission: person['parent_permission'])
        student.id = person['id']
        @people.push(student)
      end
    end
  end

  # Store Rentals in Json file
  def store_rentals
    array = []
    @rentals.each do |rental|
      array.push({
        date: rental.date,
        person_id: rental.person.id,
        book_title: rental.book.title,
        person_name: rental.person.name })
    end
    write_json(array, 'JSONdata/rentals.json')
  end

  # Read rentals from stored rentals file
  def read_rentals
  end


end