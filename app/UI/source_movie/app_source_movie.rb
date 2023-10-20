require_relative '../../models/movie/movie'
require_relative '../../models/source/source'
require_relative '../../user_data/collect_movie_data'
require_relative '../../user_data/source_data'
require_relative '../../database/movie/save_data'
require_relative '../../database/source/save_data'


def call_list_all_movies
  Movie.list_all_movies
end

def call_list_all_sources
  Source.list_all_sources
end

def call_list_add_a_movie
  movie_data = collect_movie_data
  Movie.add_a_movie(movie_data)
  save_data(movie_data, 'app/database/movie/json/movie_data.json')
end

def call_add_a_source
  Source.add_a_source(source_data)
  save_data(source_data, 'app/database/source/json/source_data.json')
end
