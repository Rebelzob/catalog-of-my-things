require 'json'

def load_data(file_path)
  if File.exist?(file_path)
    File.read(file_path)
    JSON.parse(loaded_sources)
  else
    []
  end
  puts 'Data loaded'
end
