require_relative '../item'

class Book < Item
  attr_reader :cover_state, :publisher, :id

  def initialize(cover_state, publisher, *args)
    super(*args)
    @cover_state = cover_state
    @publisher = publisher
  end

  private

  def can_be_archived?
    super || @cover_state == 'bad'
  end
end
