require 'json'
require_relative '../../user_data/collect_movie_data'
require_relative 'load_data'

def save_data(movie_data, file_path)
  existing_data = load_data(file_path)
  existing_data.push(movie_data)
  json_data = JSON.generate(existing_data)

  File.write(file_path, json_data)
  puts "data saved successfully to #{file_path}"
end
