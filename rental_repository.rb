RENTAL_ENTITY = "rentals".freeze

class RentalRepository

  def initialize(storage)
    @storage = storage
  end

  def save(rental)
    @storage.save(rental.to_h, RENTAL_ENTITY)
  end

  def load_all
    @storage.load_all(RENTAL_ENTITY).map { |rental_hash| Rental.from_hash(rental_hash) }
  end
end