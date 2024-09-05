require 'json'

class Book
  attr_accessor :title, :author, :rentals, :id

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
    JSON.generate(to_h)
  end

  def to_h
    {
      id: @id,
      title: @title,
      author: @author,
    }
  end

  def self.from_hash(hash)
    book = new(hash[:title], hash[:author])
    book.id = hash[:id]
    book
  end
end
