require_relative 'spec_helper'

describe Rental do
  before :each do
    @book = Book.new('Lord of the Rings', 'Tolkien')
    @classroom = Classroom.new('T2')
    @student = Student.new(19, @classroom, 'Maximus')
    date_str = '2020/08/13'
    date_format = '%Y/%m/%d'
    @date = Date.strptime(date_str, date_format)
    @rental = Rental.new(@date, @book, @student)
  end

  context '#new' do
    it 'returns a new rental object' do
      expect(@rental).to be_an_instance_of Rental
    end

    it 'raise ArgumentError when given fewer parameters than 3' do
      expect { Rental.new }.to raise_error ArgumentError
    end
  end

  context '#book' do
    it 'returns the correct book' do
      expect(@rental.book).to be @book
    end
  end

  context '#person' do
    it 'returns the correct person' do
      expect(@rental.person).to be @student
    end
  end

  context '#date' do
    it 'returns the correct date' do
      expect(@rental.date).to be @date
    end
  end

  context '#update_book' do
    it 'updates the rentals in book' do
      expect(@rental.book.rentals).not_to be_empty
    end
  end

  context '#update_person' do
    it 'updates the rentals in person' do
      expect(@rental.person.rentals).not_to be_empty
    end
  end

  context '#to_s' do
    it 'returns the string representation of a rental' do
      expect(@rental.to_s).to eql "Date: #{@date}, Book: \"#{@book.title}\" by #{@book.author}"
    end
  end

  context '#to_json' do
    it 'returns the json representation of a rental' do
      # rubocop:disable Layout/LineLength
      expect(@rental.to_json).to eql "{\"date\":\"2020-08-13\",\"person\":{\"id\":#{@student.id},\"name\":\"Maximus\",\"age\":19,\"parent_permission\":true,\"classroom\":{\"label\":\"T2\"}},\"book\":{\"title\":\"Lord of the Rings\",\"author\":\"Tolkien\"}}"
    end
  end

  context '#from_json' do
    it 'returns a new rental object from JSON' do
      json = JSON.parse("{\"date\":\"2020-08-13\",\"person\":{\"id\":#{@student.id},\"name\":\"Maximus\",\"age\":19,\"parent_permission\":true,\"classroom\":{\"label\":\"T2\"}},\"book\":{\"title\":\"Lord of the Rings\",\"author\":\"Tolkien\"}}")
      expect(Rental.from_json(json)).to be_an_instance_of Rental
    end
  end
end
