require 'json'

class JSONStorageStrategy

  def save(data, entity)
    existing_data = load_all
    existing_data << data
    File.open(filename, 'w') do |file|
      JSON.dump(existing_data, file)
    end
  end

  def load_all(entity)
    return [] unless File.exist?(filename)
    JSON.parse(File.read(filename), symbolize_names: true)
  end

  private 

  def filename
    "#{entity}.json"
  end
end
