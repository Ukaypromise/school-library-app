require_relative './app'

class Main
  def initialize
    @app = App.new
    @response = 0
  end

  def menu_options
    puts 'Welcome to School Library App!'
    while @response != '7'
      puts 'Please choose an option by entering a number:
       =========================================
       1 - List all books
       2 - List all people
       3 - Create a person
       4 - Create a book
       5 - Create a rental
       6 - List all rentals for a given person id
       7 - Exit
       ========================================='
      choose_action
    end
  end

  def choose_action
    @response = gets.chomp.to_i

    case @response
    when 1
      @app.display_all_books
    when 2
      @app.display_all_people
    when 3
      @app.create_a_person
    when 4
      @app.create_a_book
    when 5
      @app.create_a_rental
    when 6
      @app.list_all_rentals
    else
      puts 'Invalid option selected'
      puts 'Exiting app ...'
      exit
    end
  end
end

main = Main.new
main.menu_options
