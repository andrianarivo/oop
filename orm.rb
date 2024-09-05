class ORM
  def initialize(storage_strategy)
    @storage_strategy = storage_strategy
  end

  def save_person(person)
    @storage_strategy.save_person(person)
  end

  def save_book(book)
    @storage_strategy.save_book(book)
  end

  def save_rental(rental)
    @storage_strategy.save_rental(rental)
  end

  def load_all_people
    @storage_strategy.load_all_people
  end

  def load_all_books
    @storage_strategy.load_all_books
  end

  def load_all_rentals
    @storage_strategy.load_all_rentals
  end
end
