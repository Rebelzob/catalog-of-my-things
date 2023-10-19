require 'json'
require_relative 'genre'

class FileManager
  attr_accessor :genres, :musics, :files

  GENRES_PATH = 'app/database/genre/genre_json.json'.freeze
  MUSIC_PATH = 'app/database/music/music_json.json'.freeze

  def initialize
    @genres = []
    @musics = []
    @files = [GENRES_PATH, MUSIC_PATH]
    create_files(@files)
  end

  def create_files(files)
    files.each do |file|
      unless File.exist?(file)
        File.open(file, 'w')
        File.write(file, [], mode: 'a')
      end
    end
  end

  def load_genre
    return unless File.exist?(GENRES_PATH)

    json_to_str = File.read(GENRES_PATH)
    @genres = JSON.parse(json_to_str).map do |genre_data|
      genres = Genre.new(genre_data['name'])
      genres.id = genre_data['id']
      genres
    end
  rescue StandardError => e
    puts "Error loading Genre : #{e.message}"
  end

  def load_music
    return unless File.exist?(MUSIC_PATH)

    json_to_str = File.read(MUSIC_PATH)
    @musics = JSON.parse(json_to_str).map do |music_data|
      music = MusicAlbum.new(nil, nil)
      music.on_spotify = music_data['on_spotify']
      music.publish_date = music_data['publish_date']
      music.id = music_data['id']
      music
    end
  rescue StandardError => e
    puts "Error loading MusicAlbum : #{e.message}"
  end

  def save_genre
    temp_array = []
    @genres.each do |genre|
      temp_array.push({
                        'name' => genre.name,
                        'id' => genre.id
                      })
    end
    File.write(GENRES_PATH, temp_array.to_json)
  end

  def save_music
    temp_array = []
    @musics.each do |music|
      temp_array.push({
                        'on_spotify' => music.on_spotify,
                        'publish_date' => music.publish_date,
                        'id' => music.id
                      })
    end
    File.write(MUSIC_PATH, temp_array.to_json)
  end
end
