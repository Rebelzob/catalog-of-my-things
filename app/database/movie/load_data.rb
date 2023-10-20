require 'json'

def load_data(file_path)
  if File.exist?(file_path)
    loaded_data = File.read(file_path)
    JSON.parse(loaded_data)
  else
    []
  end
end
