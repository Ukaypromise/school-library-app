module Display
  # Display books
  def display_all_books
    if @books.empty?
      puts 'No books available. Please add books'

    else
      puts "book lists count (#{@books.count})"
      @books.each_with_index do |book, index|
        puts "#{index + 1} book in archive. Title is: #{book.title} written by: #{book.author}"
      end
    end
  end

  # Display All People
  def display_all_people
    if @people.empty?
      puts 'List empty'
      puts 'Create a person'

    else
      puts "people list (#{@people.count})"

      @people.each_with_index do |person, index|
        puts "#{index + 1} Person type: #{person.type}  person name: #{person.name}, person id: #{person.id}"
      end
    end
  end

  # List Rentals
  def list_all_rentals
    puts 'Enter persons id'

    person_id = gets.chomp.to_i

    if !@people.find { |person| person.id == person_id }
      puts 'No rentals found'
    elsif @rentals.empty?
      puts 'Empty Rental list'
    else
      puts "Rentals count(#{@people.count})"
      @rentals.select do |rental|
        if rental.person.id == person_id
          puts "Date: #{rental.date}, Book: '#{rental.book.title}' by #{rental.book.author}"
        end
      end
    end
  end
end
