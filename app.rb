require_relative 'rental'
require_relative 'book'

$books = []
$people = []
$rentals = []

def list_books
  $books.each do |book|
    puts book
  end
end

def list_people
  $people.each do |person|
    puts person
  end
end

def create_person(person)
  $people.push(person)
end

def create_book(title, author)
  book = Book.new(title, author)
  $books.push(book)
end

def create_rental(book, person)
  rental = Rental.new(Time.now.utc, book, person)
  $rentals.push(rental)
end

def list_rentals
  $rentals.each do |rental|
    puts rental
  end
end
