require_relative './student'
require_relative './teacher'
require_relative './classroom'
require_relative './book'
require_relative './rentals'

class App
  attr_accessor :book, :people, :rentals

  def initialize
    @books = []
    @people = []
    @rentals = []
  end

  def run
    action_prompt
  end

  # Display All People
  def display_all_people
    if @people.empty?
      puts 'List empty'
      puts 'Create a person'
      run
    else
      puts "people list (#{@people.count})"

      @people.each_with_index do |person, index|
        puts "#{index + 1} type: #{person.type} person name: #{person.name}, person id: #{person.id}"
      end
    end
  end

  # Create a Person
  def create_a_person
    puts 'Do you want to create a teacher or a student'
    puts
    puts 'Select 1 to create a Student'
    puts 'Select 2 to create a Teacher'

    choice = gets.chomp.to_i
    case choice
    when 1
      create_a_student
    when 2
      create_a_teacher
    else
      puts 'Select a valid option between 1 and 2'
      create_a_person
    end
  end

  # Create a Student
  def create_a_student
    puts 'Age'
    age = gets.chomp.to_i

    puts 'classroom: (A or B)'
    classroom = gets.chomp

    puts 'Name'
    name = gets.chomp

    has_permission = permit?

    new_student = Student.new(classroom, age, name: name, parent_permission: has_permission)
    @people << new_student unless @books.include?(new_student)

    puts new_student

    puts "Student #{name} with age #{age} and classroom #{classroom.upcase}, was created"

    action_prompt
  end

  # Create a Teacher
  def create_a_teacher
    puts 'Age'
    age = gets.chomp.to_i

    puts 'Specialization'
    specialization = gets.chomp

    puts 'Name'
    name = gets.chomp

    new_teacher = Teacher.new(specialization, age, name: name)
    @people << new_teacher unless @books.include?(new_teacher)

    puts "Teacher #{name} with age #{age} and specialized in #{specialization}, was created"

    action_prompt
  end

  def permit?
    puts 'Have a parent permit ? [Y / N]'

    permit = gets.chomp.upcase

    case permit
    when 'Y'
      true
    when 'N'
      false
    else
      puts 'Invalid choice'
      permit?
    end
  end

  # Creating books
  def display_all_books
    if @books.empty?
      puts 'Empty book list'
      run
    else
      puts "book lists count (#{@books.count})"
      @books.each_with_index do |book, index|
        puts "#{index + 1} book title is: #{book.title} written by: #{book.author}"
      end
    end
  end

  def create_a_book
    puts 'Book Author'
    author = gets.chomp

    puts 'Book Title'
    title = gets.chomp

    new_book = Book.new(title, author)
    @books.push(new_book)
    puts "Book #{title} written by #{author} was created"
    action_prompt
  end

  # Create Rentals
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

  def create_a_rental
    puts 'Select a book by an index'
    display_all_books
    run if @books.empty?
    book_index = gets.chomp.to_i - 1

    puts 'select a person below'
    display_all_people
    action_prompt if @people.empty?
    person_index = gets.chomp.to_i - 1

    puts 'Date [yyyy/mm/dd] : '
    date = gets.chomp

    new_rental = Rental.new(date, @people[person_index], @books[book_index])
    @rentals << new_rental unless @rentals.include?(new_rental)

    puts 'Rentals created successfully !'
    run
  end
end
