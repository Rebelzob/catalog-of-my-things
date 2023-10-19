require_relative 'item'

class MusicAlbum < Item
  attr_accessor :on_spotify

  @music_list = []

  def initialize(on_spotify, *args)
    super(*args)
    @on_spotify = on_spotify
  end

  def add_music_album
    self.class.music_list << self
  end

  class << self
    attr_reader :music_list
  end

  def self.list_all_music_albums
    @music_list.each_with_index do |music, index|
      author_name = music.author.first_name
      label_title = music.label.title
      source_name = music.source.name
      pub_date = music.publish_date
      p "#{index} - [#{name}], #{author_name}, #{label_title}, #{source_name}, #{pub_date}"
    end
  end

  private

  def can_be_archived?
    super && @on_spotify
  end
end
