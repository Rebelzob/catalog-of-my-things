require_relative 'game'

module Options
  def list_of_games
    if @games.empty?
      puts 'No Games available to display'
    else
      @games.each_with_index do |game, index|
        puts "#{index}) Multiplayer: #{game.multiplayer}, Last Played at: #{game.last_played_at}
        Publish date:#{game.publish_date} ID:#{game.id}"
      end
    end
  end

  def list_of_authors
    if @authors.empty?
      puts 'No Authors available to display'
    else
      @authors.each_with_index do |author, index|
        puts "#{index}) Firs Name: #{author.first_name}, Last Name: #{author.last_name} ID: #{author.id}"
      end
    end
  end

  def add_game
    puts 'Is the game multiplayer? [Y/N]:'
    multiplayer = gets.chomp
    puts 'Please enter Last Played date in the following formant: [yyyy/mm/dd]:'
    last_played = gets.chomp
    puts 'Please enter publish date in the following format: [yyyy/mm/dd] '
    date_publish = gets.chomp
    game = Game.new(multiplayer, last_played, date_publish)
    @games << game
    puts 'Game created successfully'
  end
end
