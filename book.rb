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

  def to_json(*_args)
    JSON.generate(
      {
        title: @title,
        author: @author
      }
    )
  end

  def self.from_json(json)
    title = json['title']
    author = json['author']
    Book.new(title, author)
  end
end
