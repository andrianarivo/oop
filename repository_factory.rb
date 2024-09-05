require_relative 'person_repository'
require_relative 'book_repository'
require_relative 'rental_repository'
require_relative 'classroom_repository'

class RepositoryFactory
  def initialize(storage_strategy)
    @storage_strategy = storage_strategy
  end

  def create_person_repository
    PersonRepository.new(@storage_strategy)
  end

  def create_book_repository
    BookRepository.new(@storage_strategy)
  end

  def create_rental_repository
    RentalRepository.new(@storage_strategy)
  end

  def create_classroom_repository
    ClassroomRepository.new(@storage_strategy)
  end
end
