require 'securerandom'

class Item
  attr_reader :id, :publish_date, :archived, :label, :genre, :author, :source

  def initialize(_id, publish_date, archived)
    @id = SecureRandom.hex(10)
    @publish_date = publish_date
    @archived = archived
  end

  def add_label(label)
    @label = label
  end

  def add_genre(genre)
    @genre = genre
  end

  def add_author(author)
    @author = author
  end

  def add_source(source)
    @source = source
  end

  def move_to_archive
    @archived = true
  end

  private

  def can_be_archived?
    !@archived
  end
end
