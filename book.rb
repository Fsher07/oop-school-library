class Book
  attr_accessor :title, :author
  attr_reader :vets

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end
end
