def collect_item_data(item_name)
  item_data = {}

  print "Add a #{item_name} title: "
  item_data[:title] = gets.chomp

  print "Select a #{item_name} genre: "
  item_data[:genre] = gets.chomp

  print "Select a #{item_name} author: "
  item_data[:author] = gets.chomp

  print "Select a #{item_name} source: "
  item_data[:source] = gets.chomp

  print "Select a #{item_name} label: "
  item_data[:label] = gets.chomp

  print "Add a #{item_name} publish_date: "
  item_data[:publish_date] = gets.chomp

  print "Add a #{item_name} archived (true/false): "
  item_data[:archived] = gets.chomp.downcase == 'true'

  item_data
end

def collect_book_data
  book_data = collect_item_data("book")

  print "Add a publisher: "
  book_data[:publisher] = gets.chomp

  print "Add a cover state: "
  book_data[:cover_state] = gets.chomp

  book_data
end

def collect_music_album_data
  music_album_data = collect_item_data("music album")

  print "Music on Spotify (y/n): "
  music_album_data[:on_spotify] = gets.chomp.downcase == 'y'

  music_album_data
end

def collect_movie_data
  movie_data = collect_item_data("movie")

  print "Silent (y/n): "
  movie_data[:silent] = gets.chomp.downcase == 'y'

  movie_data
end

def collect_game_data
  game_data = collect_item_data("game")

  print "Multiplayer (y/n): "
  game_data[:multiplayer] = gets.chomp.downcase == 'y'

  print "Last played at: "
  game_data[:last_played_at] = gets.chomp

  game_data
end