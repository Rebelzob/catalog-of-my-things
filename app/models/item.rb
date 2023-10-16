require 'securerandom'

class Item
  def initialize (id, genre, author, source, label, publish_date, archived)
    @id = SecureRandom.hex(10)
    @genre = genre
    @author = author
    @source = source
    @label = label
    @publish_date = publish_date
    @archived = archived
  end

  def move_to_archive
    @archived = true
  end

  private
  def can_be_archived?
    !@archived
  end
end
