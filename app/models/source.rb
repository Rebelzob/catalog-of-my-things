require 'securerandom'

class Source
  attr_reader :id, :items
  attr_accessor :name

  def initialize(id, name, items)
    @id = SecureRandom.hex(10)
    @name = name
    @items = items
  end

  def add_item(item)
    @items << item
    item.add_source(self)
  end
end