require 'securerandom'
require 'date'

class Item
  attr_reader :id, :archived, :label, :genre, :author, :source
  attr_accessor :publish_date

  def initialize(publish_date)
    @id = SecureRandom.hex(10)
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
