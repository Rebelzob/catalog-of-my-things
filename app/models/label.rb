require 'securerandom'

class Label
  attr_accessor :title, :color
  attr_reader :id, :items

  def initialize(_id, title, color, _items)
    @id = SecureRandom.hex(10)
    @title = title
    @color = color
    @items = []
  end

  def add_item(item)
    @items << item
    item.add_label(self)
  end
end
