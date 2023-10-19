require_relative 'item'
require_relative '../user_data/collect_movie_data'

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
    movie_list = @movies.each_with_index do |movie, index|
      puts "#{index + 1} - #{movie.title}, #{movie.label}, ID:#{movie.id}"
    end

    if movie.empty?
      puts 'The movie list is emplty'
    else
      puts "We have Movie '#{@movies.length}' movies. \n\n"
      puts movie_list
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
