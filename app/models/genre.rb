require 'securerandom'

class Genre
  attr_accessor :id, :name
  attr_reader :items

  @genre_list = []

  def initialize(_id, name)
    @id = SecureRandom.hex(10)
    @name = name
    @items = []
  end

  def add_item(item)
    @items << item
    item.add_genre(self)
  end

  def add_genre
    @genre_list.push(self)
  end

  def list_all_genres
    @genre_list.each_with_index { |genre, index| p "#{index} - #{genre.name}" }
  end
end
