require 'json'

class Book
  attr_accessor :title, :author, :rentals

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end

  def add_rental(rental)
    rental.book = self
    @rentals.push(rental)
  end

  def to_s
    "Title: \"#{@title}\", Author: #{@author}"
  end

  def to_json(*args)
    JSON.generate(
      {
        title: @title,
        author: @author,
      }
    )
  end

end
