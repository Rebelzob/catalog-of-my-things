require 'securerandom'
require_relative '../user_data/source_data'
require_relative '../database/source/load_data'

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

  def self.add_a_source(_source_data)
    @sources << self

    if @sources.nil?
      puts 'Invalid source data. Make sure all required attributes are provided.'
    else
      puts "Source '#{name}' added successfully. \n"
    end
  end

  def self.list_all_sources
    loaded_sources = load_data('database/source/json/source_data.json')
    if loaded_sources.nil?
      puts "The source list is has no record. \n\n"
    elsif loaded_sources.empty?
      puts "The source list is empty \n\n"
    else
      puts "We have #{loaded_sources.length} sources. \n"
      loaded_sources.each_with_index do |source, index|
        puts "#{index + 1} - #{source['name']}"
      end
    end
  end

  def self.find_source_by_index(index)
    puts @sources
    @sources[index]
  end

  def add_item(item)
    @items << item
    item.add_source(self)
  end

  class << self
    attr_reader :sources
  end
end
