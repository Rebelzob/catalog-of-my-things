require 'securerandom'
require 'date'

class Item
  attr_reader :id, :publish_date, :archived, :label, :genre, :author, :source


  def initialize(_params = {})

  # def initialize(publish_date)

    @id = SecureRandom.hex(10)
    @title = title
    @author = author
    @genre = genre
    @label = label
    @source = source
    @publish_date = publish_date
    @archived = archived
  end

  def add_label(label)
    @label = label
  end

  def add_genre(genre)
    @genre = genre
    genre.add_item(self) unless genre.items.include?(self)
  end

  def add_author(author)
    @author = author
  end

  def add_source(source)
    @source = source
  end

  def move_to_archive
    @archived = true if can_be_archived?
  end

  private

  def can_be_archived?
    Time.now.year - Date.parse(publish_date).year > 10
  end
end
