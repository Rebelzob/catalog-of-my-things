require_relative 'item'
require_relative '../user_data/collect_movie_data'
require_relative '../database/movie/load_data'

class Movie < Item
  attr_reader :id
  attr_accessor :title, :genre, :author, :source, :label, :publish_date, :archived, :silent

  @movies = []

  def initialize(_title, _source, _publish_date, _archived, silent)
    super()
    @silent = silent
  end

  def self.add_a_movie(title, source, publish_date, archived, silent)
    movie = Movie.new(title, source, publish_date, archived, silent)
    @movies << movie

    if movie.nil?
      puts 'Invalid movie data. Make sure all required attributes are provided.'
    else
      puts "Movie '#{title}' added successfully. \n\n"
    end
  end

  def self.list_all_movies
    loaded_movies = load_data('data/movie_data.json')
    if loaded_movies.nil?
      puts 'Failed to load movie data.'
    elsif loaded_movies.empty?
      puts 'The movie list is empty'
    else
      puts "We have Movie '#{loaded_movies.length}' movies. \n"
      loaded_movies.each_with_index do |movie, index|
        puts "#{index + 1} - Title: #{movie['title']}, Pusbished on: #{movie['publish_date']}"
      end
    end
  end

  def self.find_movie_by_index(index)
    @movies[index]
  end

  private

  def can_be_archived?
    true if super.can_be_archived? || silent == true
  end
end
