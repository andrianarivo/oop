CLASSROOM_ENTITY = "classrooms".freeze

class ClassroomRepository

  def initialize(storage)
    @storage = storage
  end

  def save(classroom)
    @storage.save(classroom.to_h, CLASSROOM_ENTITY)
  end

  def load_all
    @storage.load_all(CLASSROOM_ENTITY).map { |classroom_hash| Classroom.from_hash(classroom_hash) }
  end
end