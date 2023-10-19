require_relative '../../models/movie'
require_relative '../../models/source'
require_relative '../../user_data/collect_movie_data'
require_relative '../../user_data/source_data'

class Main
  def main
    loop do
      options

      choice = gets.chomp

      case choice
      when '1'
        Movie.list_all_movies
      when '2'
        Source.list_all_sources
      when '3'
        movie_data = collect_movie_data
        Movie.add_a_movie(movie_data[:title], movie_data[:source], movie_data[:publish_date], movie_data[:archived],
                          movie_data[:silent])
        # Add save here
      when '4'
        Source.add_a_source(source_data)
        # Add save here
      when '5'
        exit
      else
        puts 'Invalid choice. Please try again.'
      end
    end
  end
end

def options
  puts 'Menu options:'
  puts '1 - List all movies'
  puts '2 - List all sources'
  puts '3 - Add a movie'
  puts '4 - Add a source'
  puts '5 - Exit'
  print 'Enter your choice: '
end

app = Main.new
app.main