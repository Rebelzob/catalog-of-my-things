require 'json'
require_relative 'load_data'

def save_data(source_data, file_path)
  existing_data = load_data(file_path)
  existing_data.push(source_data)
  json_data = JSON.generate(existing_data)

  File.write(file_path, json_data)
  puts "data saved successfully to #{file_path}"
end
