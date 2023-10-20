require_relative 'genre'
require_relative '../music_genre_file_manager/file_manager'

module GenreData
  Genre.genre_list = FileManager.new.load_genre
end
