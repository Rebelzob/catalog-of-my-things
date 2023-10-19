def collect_game_data
  game_data = {}

  print 'Add a title: '
  game_data[:title] = gets.chomp

  print 'Select a genre: '
  game_data[:genre] = gets.chomp

  print 'Select an author: '
  game_data[:author] = gets.chomp

  print 'Select a source: '
  game_data[:source] = gets.chomp

  print 'Select a label: '
  game_data[:label] = gets.chomp

  print 'Add a publish_date: '
  game_data[:publish_date] = gets.chomp

  print 'Add a archived (true/false): '
  game_data[:archived] = gets.chomp.downcase == 'true'

  print 'Multiplayer (y/n): '
  game_data[:multiplayer] = gets.chomp.downcase == 'y'

  print 'Last played at: '
  game_data[:last_played_at] = gets.chomp

  game_data
end
