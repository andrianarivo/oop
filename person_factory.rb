class PersonFactory
  def self.from_hash(hash, storage)
    if not hash[:specialization].nil?
      Teacher.from_hash(hash)
    elsif not hash[:classroom_id].nil?
      Student.from_hash(hash, storage)
    else
      Person.from_hash(hash)
    end
  end
end