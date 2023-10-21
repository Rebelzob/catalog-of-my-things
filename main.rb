require_relative 'app/models/game/options'
require_relative 'app/models/game/save_load_game_author'
require_relative 'app/models/game/game'
require_relative 'app/models/game/author'
require_relative 'app/models/music/music_data'
require_relative 'app/models/music/music_menu'
require_relative 'app/models/genre/genre_data'
require_relative 'app/models/display_methods'
require_relative 'app/models/book/book_data'
require_relative 'app/models/create_methods'
require_relative 'app/UI/source_movie/app_source_movie'

class App
  include Display
  include BookLabelData
  include Create
  include Options
  include LoadGameAuthor
  include MusicData
  include MusicMenu

  def initialize
    # genres = load_genre
    @labels = load_labels || []
    @books = load_books || []
    @games = load_games
    @authors = load_authors
  end

  def init
    loop do
      display_list
    end
  end

  def display_menu
    puts " \n Select an option:"
    puts '1) List items (Games, Books, Music albums or Movies)'
    puts '2) List categories (Authors, Labels, Genres or Sources )'
    puts '3) Create items (Game, Book, Music album or Movie)'
    puts '4) Exit'
  end

  def display_list
    display_menu
    option = gets.chomp.to_i
    case option
    when 1
      list_items
    when 2
      list_categories
    when 3
      create_items
    when 4
      handle_exit
    else
      puts 'Invalid option'
    end
  end

  def items_options
    puts " \n Select an option:"
    puts '1) List all Books'
    puts '2) List all Music albums'
    puts '3) List all Games'
    puts '4) List all Movies'
    puts '5) Go back to Main Menu'
  end

  def list_items
    items_options
    option = gets.chomp.to_i
    case option
    when 1
      list_of_books
    when 2
      load_all_musics
    when 3
      list_of_games
    when 4
      call_list_all_movies
    when 5
      display_list
    else
      puts 'Please select a valid option'
    end
  end

  def categories_options
    puts " \n Select an option:"
    puts '1) List all Authors'
    puts '2) List all Labels'
    puts '3) List all Genres'
    puts '4) List all Sources'
    puts '5) Go back to Main Menu'
  end

  def list_categories
    categories_options

    option = gets.chomp.to_i
    case option
    when 1
      list_of_authors
    when 2
      list_of_labels
    when 3
      Genre.list_all_genres
    when 4
      call_list_all_sources
    when 5
      display_list
    else
      puts 'Please select a valid option'
    end
  end

  def create_items_options
    puts " \n Select an option:"
    puts '1) Create a Book'
    puts '2) Create a Music Album'
    puts '3) Create a Game'
    puts '4) Create a Movie'
    puts '5) Go back to Main Menu'
  end

  def create_items
    create_items_options
    option = gets.chomp.to_i
    case option
    when 1
      menu_create_book
    when 2
      menu_create_music
    when 3
      add_game
    when 4
      # add_movie
      call_list_add_a_movie

    when 5
      display_list
    else
      puts 'Please select a valid option'
    end
  end

  def handle_exit
    save_music
    # save_genre
    save_authors
    save_games
    save_books(@books)
    save_labels(@labels)
    puts 'Thank you for using this app!'
    exit
  end
end

def main
  app = App.new
  puts 'welcome!'
  app.init
end

main