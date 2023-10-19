def collect_music_album_data
  music_album_data = {}

  print 'Add a title: '
  music_album_data[:title] = gets.chomp

  print 'Select a genre: '
  music_album_data[:genre] = gets.chomp

  print 'Select an author: '
  music_album_data[:author] = gets.chomp

  print 'Select a source: '
  music_album_data[:source] = gets.chomp

  print 'Select a label: '
  music_album_data[:label] = gets.chomp

  print 'Add a publish_date: '
  music_album_data[:publish_date] = gets.chomp

  print 'Add a archived (true/false): '
  music_album_data[:archived] = gets.chomp.downcase == 'true'

  print 'Music on Spotify (y/n): '
  music_album_data[:on_spotify] = gets.chomp.downcase == 'y'

  music_album_data
end
