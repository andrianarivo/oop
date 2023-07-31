require_relative 'rental'
require_relative 'book'
require_relative 'classroom'
require_relative 'student'
require_relative 'teacher'
require_relative 'person'
require 'date'

class App
  attr_reader :books, :people, :rentals

  def initialize
    @books = []
    @people = []
    @rentals = []
  end

  def list_books
    if @books.empty?
      puts 'No book record found'
    else
      @books.each do |book|
        puts book.to_s
      end
    end
    puts "\n"
  end

  def list_people
    if @people.empty?
      puts 'No Person record found'
    else
      @people.each do |person|
        puts person.to_s
      end
    end
  end

  def create_person
    print 'Do you want to create a student 1 or a teacher 2 ?[Input the Number]: '
    choice = gets.chomp.to_i
    print 'Age: '
    age = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp
    if choice == 1
      person = create_student(age, name)
    elsif choice == 2
      person = create_teacher(age, name)
    else
      puts 'Invalid person type'
      person = Person.new(age, name)
    end
    @people << person
    puts 'Person created successfully'
  end

  def create_book
    puts 'Enter Book Details'
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    book = Book.new(title, author)
    @books << book
  end

  def create_rental
    if @books.empty?
      puts 'No Book record found.'
    elsif @people.empty?
      puts 'No Person record found.'
    else
      selected_book = select_book
      selected_person = select_person
      date = enter_date

      rental = Rental.new(date, selected_book, selected_person)

      @rentals << rental
      puts 'Rental created successfully'
    end
  end

  def list_rentals_for_person
    if @rentals.empty?
      puts 'No Rental record found'
    else
      print 'Enter person ID: '
      person_id = gets.chomp.to_i

      puts 'Rentals Details:'
      filtered_rentals = @rentals.filter { |rental| rental.person.id == person_id }
      filtered_rentals.each_with_index do |rental, idx|
        puts "#{idx + 1} - #{rental}"
      end
      puts 'No rentals found for the given person' if filtered_rentals.empty?
    end
  end

  private

  def select_book
    puts 'Select a book from the following list by number:'
    @books.each_with_index do |book, index|
      puts "#{index + 1} Title: \"#{book.title}\", Author: #{book.author}"
    end
    book_idx = gets.chomp.to_i
    @books[book_idx - 1] if @books.length > (book_idx - 1)
  end

  def select_person
    puts 'Select a person from the following list by number (not id):'
    @people.each_with_index do |person, index|
      puts "#{index + 1} Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
    person_idx = gets.chomp.to_i
    @people[person_idx - 1] if @people.length > (person_idx - 1)
  end

  def create_student(age, name)
    print 'Has parent permission? [Y/n]: '
    parent_permission = gets.chomp.downcase == 'y'
    classroom = Classroom.new('T2')
    Student.new(age, classroom, name, parent_permission: parent_permission)
  end

  def create_teacher(age, name)
    print 'Specialization: '
    specialization = gets.chomp
    Teacher.new(age, specialization, name)
  end

  def enter_date
    print 'Enter rental date: '
    date_str = gets.chomp
    date_format = '%Y/%m/%d'
    Date.strptime(date_str, date_format)
  end

end
