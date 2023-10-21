require 'json'

def load_data(file_path)
  if File.exist?(file_path)
    loaded_sources = File.read(file_path)
    JSON.parse(loaded_sources)
  else
    []
  end
end
