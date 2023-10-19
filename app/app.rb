require_relative 'user_data/author_data'
require_relative 'user_data/genre_data'
require_relative 'user_data/label_data'
require_relative 'models/game/options'
require_relative 'models/game/save_load_game_author'
require_relative 'models/game/game'
require_relative 'models/game/author'
require_relative 'models/display_methods'
require_relative 'models/book/book_data'
require_relative 'models/create_methods'

# require_relative 'user_data/source_data'

# require_relative 'user_data/item_data'

class App
  include AuthorData
  include GenreData
  include LabelData
  include Display
  include BookLabelData
  # include ItemData
  include Create
  include Options
  include LoadGameAuthor

  def initialize
    # collect_item_data
    # source_data
    # genre_data
    @labels = load_labels || []
    @books = load_books || []
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
    puts '2 - List all books'
    puts '3 - List all music albums'
    puts '3 - List all authors'
    puts '4 - List all labels'
    puts '5 - Add a label'
    puts '6 - Add a game'
    puts '7 - Add a book'
    puts '8 - Exit'
  end

  def run_app(option)
    case option
    when 1
      list_of_games
    when 2
      list_of_books
    when 3
      list_of_authors
    when 4
      list_of_labels
    when 5
      menu_create_label
    when 6
      add_game
    when 7
      menu_create_book
    when 8
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
    save_books(@books)
    save_labels(@labels)
    puts 'Thank you for using this app!'
  end

  def init
    puts 'welcome'
    run_app
  end
end
