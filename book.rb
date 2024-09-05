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
    JSON.generate(to_h)
  end

  def to_h
    {
      title: @title,
      author: @author,
      entity_type: self.class
    }
  end

  def self.from_hash(hash)
    new(hash[:title], hash[:author])
  end
end
