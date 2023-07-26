# frozen_string_literal: true

class Rental
  attr_reader :book, :person
  attr_accessor :date

  def initialize(date, book, person)
    @date = date
    set_book(book)
    set_person(person)
  end

  def person=(person)
    set_person(person)
  end

  def book=(book)
    set_book(book)
  end

  private

  def set_book(book)
    book.rentals.push(self) unless book.rentals.include?(self)
    @book = book
  end

  def set_person(person)
    person.rentals.push(self) unless person.rentals.include?(self)
    @person = person
  end

end
