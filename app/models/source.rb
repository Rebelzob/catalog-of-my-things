require 'securerandom'
require_relative '../user_data/label_data'

class Source
  attr_reader :id, :items
  attr_accessor :name

  include SourceData

  @sources = []

  def initialize(id, name, items)
    @id = SecureRandom.hex(10)
    @name = name
    @items = items
  end

  def self.add_a_source
    source_data = SourceData.source_data
    source = Source.new(source_data)
    @sources << source
  end

  def self.list_all_sources
    @sources.each_with_index { |source, index| puts "#{index} - #{source.name}, ID: #{source.id}"}
  end

  def self.find_source_by_index(index)
    @sources[index]
  end

  def add_item(item)
    @items << item
    item.add_source(self)
  end
end