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

end

