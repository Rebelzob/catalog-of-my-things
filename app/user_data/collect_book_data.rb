def collect_book_data
  print 'Add a title: '
  book_data[:title] = gets.chomp

  print 'Select a genre by its index: '
  Genre.list_all_genres
  index = gets.chomp
  book_data[:genre] = Book.select_book_by_index(index)

  print 'Select an author: '
  book_data[:author] = gets.chomp

  print 'Select a source: '
  book_data[:source] = gets.chomp

  print 'Select a label: '
  book_data[:label] = gets.chomp

  print 'Add a publish_date: '
  book_data[:publish_date] = gets.chomp

  print 'Add a archived (true/false): '
  book_data[:archived] = gets.chomp.downcase == 'true'

  print 'Add a publisher: '
  book_data[:publisher] = gets.chomp

  print 'Add a cover state: '
  book_data[:cover_state] = gets.chomp
end
