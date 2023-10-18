require_relative '../user_data/item_data'

class Movie < Item
  attr_reader :id
  attr_accessor :name, :genre, :author, :source, :label, :publish_date, :archived, :silent

  def initialize(name, genre, author, source, label, publish_date, archived, silent)
    super(name, genre, author, source, label, publish_date, archived)
    @silent = silent
  end

  private

  def can_be_archived?
    return true if super.can_be_archived? || silent == true
  end
end