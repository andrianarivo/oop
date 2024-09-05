PEOPLE_ENTITY = "people".freeze

class PersonRepository

  def initialize(storage)
    @storage = storage
  end

  def save(person)
    @storage.save(person.to_h, PEOPLE_ENTITY)
  end

  def load_all
    @storage.load_all(PEOPLE_ENTITY).map do |person_hash|
      if person_hash.key?(:specialization)
        Teacher.from_hash(person_hash)
      elsif person_hash.key?(:classroom)
        Student.from_hash(person_hash)
      else
        Person.from_hash(person_hash)
      end
    end
  end
end