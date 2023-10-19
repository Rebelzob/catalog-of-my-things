require_relative 'user_data/author_data'
require_relative 'user_data/genre_data'
require_relative 'user_data/label_data'
require_relative 'models/game/options'
require_relative 'models/game/save_load_game_author'
require_relative 'models/game/game'
require_relative 'models/game/author'

# require_relative 'user_data/source_data'
# require_relative 'user_data/item_data'

class App
  include AuthorData
  include GenreData
  include LabelData
  # include SourceData
  # include ItemData
  include Options
  include LoadGameAuthor

  def initialize
    # collect_item_data
    # source_data
    # author_data
    # genre_data
    # label_data
    @games = load_games
    @authors = load_authors
    display_menu
  end

  def display_menu
    loop do
      option_list
      @option = gets.chomp.to_i

      run_app(@option)
    end
  end

  def option_list
    puts '1 - List all games'
    puts '2 - List all authors'
    puts '3 - Add a game'
    puts '4 - Exit'
  end

  def run_app(option)
    case option
    when 1
      list_of_games
    when 2
      list_of_authors
    when 3
      add_game
    when 4
      handle_exit
      sleep 1
      exit
    else
      puts 'invalid option'
    end
  end

  def handle_exit
    save_authors
    save_games
    puts 'Thank you for using this app!'
  end

  def init
    puts 'welcome'
    run_app
  end
end
