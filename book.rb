class Book
  attr_accessor :title, :author, :rentals

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end

  def add_rental(rental)
    @rentals << rental
  end

  def self.all
    books = []
    ObjectSpace.each_object(Book) { |book| books << book }
    books
  end
end
