def collect_movie_data
  print 'Add a title: '
  gets.chomp

  # print 'Select a genre: '
  # Genre.list_all_genres
  # index = gets.chomp
  # movie_data[:genre] = Genre.find_genre_by_index(index)

  # print 'Select an author: '
  # Author.list_all_genres
  # index = gets.chomp.to_i
  # movie_data[:author] = Author.find_author_by_index(index)

  print 'Select a source: '
  Source.list_all_sources
  index = gets.chomp.to_i
  Source.find_source_by_index(index)

  # print 'Select a label: '
  # Label.list_all_labels
  # index = gets.chomp
  # movie_data[:label] = Label.find_label_by_index(index)

  print 'Add a publish_date [YYYY-MM-DD]: '
  publish_date = gets.chomp

  print 'Add a archived (y/n): '
  archived_input = gets.chomp.downcase
  %w[true false].include?(archived_input)

  print 'Silent (y/n): '
  silent = gets.chomp.downcase == 'y'

  Movie.new(publish_date, silent)
end
