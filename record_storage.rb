require 'json'

RENTALS_PATH = 'rentals.json'.freeze
BOOKS_PATH = 'books.json'.freeze
PEOPLE_PATH = 'people.json'.freeze

class RecordStorage
  def self.save(books, people, rentals)
    save_books(books)
    save_people(people)
    save_rentals(rentals)
  end

  def self.reload
    reload_books
    reload_people
    reload_rentals
    [@books, @people, @rentals]
  end

  def self.save_rentals(rentals)
    File.open(RENTALS_PATH, 'w') do |file|
      JSON.dump(rentals, file)
    end
  end

  def self.save_people(people)
    File.open(PEOPLE_PATH, 'w') do |file|
      JSON.dump(people, file)
    end
  end

  def self.save_books(books)
    File.open(BOOKS_PATH, 'w') do |file|
      JSON.dump(books, file)
    end
  end

  def self.reload_rentals
    @rentals = []
    return unless File.exist?(RENTALS_PATH)

    rentals_string = File.read(RENTALS_PATH)
    rentals_json = JSON.parse(rentals_string)
    rentals_json.each do |rental_json|
      person = @people.select { |e| e.name == rental_json['person']['name'] }.first
      book = @books.select { |e| e.title == rental_json['book']['title'] }.first
      date_str = rental_json['date']
      date_format = '%Y-%m-%d'
      date = Date.strptime(date_str, date_format)
      @rentals << Rental.new(date, book, person)
    end
  end

  def self.reload_books
    @books = []
    return unless File.exist?(BOOKS_PATH)

    books_string = File.read(BOOKS_PATH)
    books_json = JSON.parse(books_string)
    books_json.each do |book_json|
      @books << Book.from_json(book_json)
    end
  end

  def self.reload_people
    @people = []
    return unless File.exist?(PEOPLE_PATH)

    people_string = File.read(PEOPLE_PATH)
    people_json = JSON.parse(people_string)
    people_json.each do |person_json|
      @people << Teacher.from_json(person_json) if person_json.key?('specialization')
      @people << Student.from_json(person_json) if person_json.key?('classroom')
    end
  end
end
