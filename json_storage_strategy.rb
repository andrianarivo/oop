require 'json'

RENTALS_PATH = 'rentals.json'.freeze
BOOKS_PATH = 'books.json'.freeze
PEOPLE_PATH = 'people.json'.freeze

class JSONStorageStrategy
  RENTALS_FILE = 'rentals.json'.freeze
  BOOKS_FILE = 'books.json'.freeze
  PEOPLE_FILE = 'people.json'.freeze

  def save_person(person)
    people = load_all_people
    i = people.index { |p| p.id == person.id }
    if i != nil
      people[i] = person
    else
      people << person
    end
    File.open(PEOPLE_PATH, 'w') do |file|
      JSON.dump(people, file)
    end
  end

  def save_book(book)
    books = load_all_books
    i = books.index { |b| b.id == book.id }
    if i != nil
      books[i] = book
    else
      books << book
    end
    File.open(BOOKS_FILE, 'w') do |file|
      JSON.dump(books, file)
    end
  end

  def save_rental(rental)
    rentals = load_all_rentals
    i = rentals.index { |r| r.id == rental.id }
    if i != nil
      rentals[i] = rental
    else
      rentals << rental
    end
    File.open(RENTALS_PATH, 'w') do |file|
      JSON.dump(rentals, file)
    end
  end

  def load_all_people
    return [] unless File.exist?(PEOPLE_FILE)

    JSON.parse(File.read(PEOPLE_PATH)).map do |person_json|
      if person_json.key?('specialization')
        Teacher.from_json(person_json)
      elsif person_json.key?('classroom')
        Student.from_json(person_json)
      end
    end
  end

  def load_all_books
    return [] unless File.exist?(BOOKS_FILE)

    JSON.parse(File.read(BOOKS_PATH)).map do |book_json|
      books << Book.from_json(book_json)
    end
 end

  def load_all_rentals
    return [] unless File.exist?(RENTALS_FILE)

    JSON.parse(File.read(RENTALS_PATH)).map do |rental_json|
      person = load_all_people.select { |e| e.name == rental_json['person']['name'] }.first
      book = load_all_books.select { |e| e.title == rental_json['book']['title'] }.first
      date_str = rental_json['date']
      date_format = '%Y-%m-%d'
      date = Date.strptime(date_str, date_format)
      rentals << Rental.new(date, book, person)
    end
 end
end
