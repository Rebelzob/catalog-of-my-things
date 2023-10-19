require 'securerandom'
require_relative '../user_data/source_data'

class Source
  attr_reader :id, :items
  attr_accessor :name

  @sources = []

  def initialize(name)
    @id = SecureRandom.hex(10)
    @name = name
    @items = []
    # self.class.sources << self
  end

  def self.add_a_source(name)
    source = Source.new(name)
    @sources << source

    if source.nil?
      puts 'Invalid source data. Make sure all required attributes are provided.'
    else
      puts "Source '#{name}' added successfully. \n\n"
    end
  end

  def self.list_all_sources
    source_list = @sources.each_with_index do |source, index|
      puts "#{index + 1} - #{source.name}, ID: #{source.id}"
    end

    if @sources.empty?
      puts 'The source list is empty'
    else
      puts "We have Movie '#{@sources.length}' movies. \n\n"
      puts source_list
    end
  end

  def self.find_source_by_index(index)
    @sources[index]
  end

  def add_item(item)
    @items << item
    item.add_source(self)
  end
end
