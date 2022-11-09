require 'json'
require './database'
require './database_read'
require_relative './student'
require_relative './teacher'
require_relative './classroom'
require_relative './book'
require_relative './rentals'
require_relative './module/display'

class App
  attr_accessor :book, :people, :rentals

  def initialize
    @books = read_book
    @people = read_person
    @rentals = read_rentals
  end

  include Database
  include ReadDatabase
  include Display

  # Create a Person
  def create_a_person
    puts 'Do you want to create a teacher or a student'
    puts 'Please choose an option by entering a number:'
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
    @people << {
      name: new_student.name,
      type: new_student.type,
      age: new_student.age,
      classroom: new_student.classroom,
      id: new_student.id
    }

    write_person(@people)

    puts "Student #{name} with age #{age} and classroom #{classroom.upcase}, was created"
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
    @people << {
      name: new_teacher.name,
      type: new_teacher.type,
      age: new_teacher.age,
      id: new_teacher.id
    }
    write_person(@people)

    puts "Teacher #{name} with age #{age} and specialized in #{specialization}, was created"
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

  # Create books

  def create_a_book
    puts 'Book Author'
    author = gets.chomp

    puts 'Book Title'
    title = gets.chomp

    new_book = Book.new(title, author)
    @books << {
      title: new_book.title,
      author: new_book.author
    }
    write_book(@books)
    puts "Book #{title} written by #{author} was created"
  end

  # Create Rentals

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
     @rentals << {
      date: new_rental.date,
      index: new_rental.person['id'],
      books: new_rental.book['id']
    }
    write_rental(@rentals)
    puts 'Rentals created successfully !'
  end
end
