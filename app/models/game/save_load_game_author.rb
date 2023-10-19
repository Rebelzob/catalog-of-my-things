require 'json'

module LoadGameAuthor
    GAME_PATH = 'app/database/game_json.json'.freeze
    AUTHOR_PATH = 'app/database/author_json.json'.freeze


    def load_games
      return [] unless File.exist?(GAME_PATH)
      games = [] 
      json_to_str = File.read(GAME_PATH) 
      JSON.parse(json_to_str).map do |game_data|
      game_obj = Game.new(game_data['multiplayer'],game_data['last_played_at'],game_data['publish_date'])
      games << game_obj
      end
      games
    rescue StandardError => e
    puts "Error loading Games: #{e.message}"
    end

    def load_authors
      return [] unless File.exist?(AUTHOR_PATH)
      authors = [] 
      json_to_str = File.read(AUTHOR_PATH)
      
      JSON.parse(json_to_str).map do |author_data|
      author_obj = Author.new(author_data['first_name'],author_data['last_name'])
      authors << author_obj
      end
      authors
    rescue StandardError => e
    puts "Error loading Author: #{e.message}"
    end

    def save_games
    hash_game = @games.map do |game|
            {
              'multiplayer' => game.multiplayer,
              'last_played_at' => game.last_played_at,
              'publish_date' => game.publish_date,
              'id' => game.id,
            }
          end
      File.write( GAME_PATH, hash_game.to_json )
      puts 'Games saved sucessfuly!'
    end
    
    def save_authors
      hash_author = @authors.map do |author|
        { 
          'id' => author.id,
          'first_name' => author.first_name,
          'last_name' => author.last_name,
        }
      end
  File.write( AUTHOR_PATH, hash_author.to_json )
  puts 'Authors saved sucessfuly!'
    end    
end    