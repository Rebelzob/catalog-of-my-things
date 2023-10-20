require_relative '../item'

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
    attr_accessor :music_list
  end

  def self.list_all_music_albums
    @music_list.each_with_index do |music, index|
      on_spotify = music.on_spotify
      pub_date = music.publish_date
      print "#{index} - publish date: #{pub_date}, on spotify: #{on_spotify}\n"
    end
  end

  private

  def can_be_archived?
    super && @on_spotify
  end
end
