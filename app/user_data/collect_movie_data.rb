def collect_movie_data
  print 'Add a title: '
  gets.chomp

  print 'Select a source: '
  Source.list_all_sources
  index = gets.chomp.to_i
  Source.find_source_by_index(index)

  print 'Add a publish_date [YYYY-MM-DD]: '
  publish_date = gets.chomp

  print 'Add a archived (y/n): '
  archived_input = gets.chomp.downcase
  %w[true false].include?(archived_input)

  print 'Silent (y/n): '
  silent = gets.chomp.downcase == 'y'

  # movie
  { publish_date: publish_date, silent: silent }
end
