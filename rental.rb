require 'json'

class Rental
  attr_reader :book, :person
  attr_accessor :date, :id

  def initialize(date, book, person)
    @date = date
    update_book(book)
    update_person(person)
  end

  def person=(person)
    update_person(person)
  end

  def book=(book)
    update_book(book)
  end

  def to_s
    "Date: #{date}, Book: \"#{@book.title}\" by #{@book.author}"
  end

  def to_json(*_args)
    JSON.generate(to_h)
  end

  def to_h
    {
      id: @id,
      date: @date,
      person_id: @person.id,
      book_id: @book.id,
    }
  end

  def self.from_hash(hash, storage)
    date_str = hash[:date]
    date_format = '%Y-%m-%d'
    date = Date.strptime(date_str, date_format)
    book_hash = storage.load_all(BOOK_ENTITY).find { |b| b[:id] == hash[:book_id] }
    person_hash = storage.load_all(PEOPLE_ENTITY).find { |p| p[:id] == hash[:person_id] }
    person = PersonFactory.from_hash(person_hash, storage)
    rental = new(date, Book.from_hash(book_hash), person)
    rental.id = hash[:id]
    rental
  end

  private

  def update_book(book)
    book.rentals.push(self) unless book.rentals.include?(self)
    @book = book
  end

  def update_person(person)
    person.rentals.push(self) unless person.rentals.include?(self)
    @person = person
  end
end
