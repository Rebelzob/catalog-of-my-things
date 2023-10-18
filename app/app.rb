require_relative 'user_data/author_data'
require_relative 'user_data/genre_data'
require_relative 'user_data/label_data'
require_relative 'models/game/options'
require_relative 'models/display_methods'
# require_relative 'user_data/item_data'

class App
  include AuthorData
  include GenreData
  include LabelData
  include Display
  # include SourceData
  # include ItemData
  include Options

  def initialize
    # collect_item_data
    # source_data
    # author_data
    @labels = []
    @books = []
    @games = []
    @authors = []
  end

  def init
    puts 'welcome'
    list_of_games
    list_of_authors
  end
end
