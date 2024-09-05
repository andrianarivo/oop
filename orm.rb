class ORM
  def initialize(repository_factory)
    @repository_factory = repository_factory
  end

  def save_person(person)
    @repository_factory.create_person_repository.save(person)
  end

  def save_book(book)
    @repository_factory.create_book_repository.save(book)
  end

  def save_rental(rental)
    @repository_factory.create_rental_repository.save(rental)
  end

  def load_all_people
    @repository_factory.create_person_repository.load_all
  end

  def load_all_books
    @repository_factory.create_book_repository.load_all
  end

  def load_all_rentals
    @repository_factory.create_rental_repository.load_all
  end
end
