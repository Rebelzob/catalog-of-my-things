require_relative 'item'

class MusicAlbum < Item
  attr_accessor :on_spotify

  @music_list = []

  def initialize(on_spotify, *args)
    super(*args)
    @on_spotify = on_spotify
  end

  def add_music_album
    @music_list.push(self)
  end

  def list_all_music_albums
    @music_list.each_with_index do |music, index|
      p "#{index} - [#{self.class.name}], #{music.author}, #{music.label}, #{music.source.name}, #{music.publish_date}"
    end
  end

  private

  def can_be_archived?
    super && @on_spotify
  end
end
