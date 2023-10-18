require_relative '../user_data/item_data'

class Movie < Item
  attr_reader :id
  attr_accessor :name, :genre, :author, :source, :label, :publish_date, :archived, :silent

  include ItemData

  @movies = []

  def initialize(silent, *args)
    super(*args)
    @silent = silent
  end

  def self.add_a_movie(movie_data)
    movie = Movie.new(movie_data)

    @movies << movie
  end

  def self.list_all_movies
    @movies.each_with_index { |movie, index| puts "#{index} - #{movie.name}, #{movie.label}, ID:#{movie.id}" }
  end

  def self.find_movie_by_index(index)
    @movies[index]
  end

  private

  def can_be_archived?
    true if super.can_be_archived? || silent == true
  end
end
