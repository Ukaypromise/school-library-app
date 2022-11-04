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
end

