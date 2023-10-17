module GenreData
  def genre_data
    print 'Add a genre name: '
    name = gets.chomp

    { name: name }
  end
end
