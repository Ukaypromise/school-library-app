class Book
  attr_accessor :title, :author, :rentals

  def instantiate(title, author)
    @title = title
    @author = author
    @rentals = []
  end

  def add_rental
    @rentals.push(rental)
    rental.book = self
  end
end
