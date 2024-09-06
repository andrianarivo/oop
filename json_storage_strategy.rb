require 'json'

class JSONStorageStrategy

  def save(data, entity)
    existing_data = load_all(entity)
    data[:id] = existing_data.length + 1
    existing_data << data
    File.open(filename(entity), 'w') do |file|
      JSON.dump(existing_data, file)
    end
  end

  def load_all(entity)
    return [] unless File.exist?(filename(entity))
    JSON.parse(File.read(filename(entity)), symbolize_names: true)
  end

  private 

  def filename(entity)
    "#{entity}.json"
  end
end
