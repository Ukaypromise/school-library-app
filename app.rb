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
#Display All People
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
#Create a Person
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

end

