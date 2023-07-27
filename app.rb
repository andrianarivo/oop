require_relative 'rental'
require_relative 'book'
require 'date'

class App
  attr_reader :books, :people, :rentals

  def initialize
    @books = []
    @people = []
    @rentals = []
  end

  def list_books
    @books.each_with_index do |book, idx|
      puts "#{idx + 1} - #{book}"
    end
    puts "\n"
  end

  def list_people
    @people.each_with_index do |person, idx|
      puts "#{idx + 1} - #{person}"
    end
    puts "\n"
  end

  def create_person(person)
    @people.push(person)
  end

  def create_book(book)
    @books.push(book)
  end

  def create_rental(rental)
    @rentals.push(rental)
  end

  def list_rentals(person_id)
    filtered_rentals = @rentals.filter { |rental| rental.person.id == person_id }
    filtered_rentals.each_with_index do |rental, idx|
      puts "#{idx + 1} - #{rental}"
    end
    puts "\n"
  end
end
