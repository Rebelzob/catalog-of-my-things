module GenreData

  def genre_data
    print "Add a genre name: "
    name = gets.chomp

    genre_data = { name: name }
  end
end