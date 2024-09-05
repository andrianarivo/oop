BOOK_ENTITY = "books".freeze

class BookRepository

  def initialize(storage)
    @storage = storage
  end

  def save(book)
    @storage.save(book.to_h, BOOK_ENTITY)
  end

  def load_all
    @storage.load_all(BOOK_ENTITY).map { |book_hash| Book.from_hash(book_hash) }
  end
end
