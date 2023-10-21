require_relative 'music'
require_relative '../music_genre_file_manager/file_manager'

module MusicData
  MusicAlbum.music_list = FileManager.new.load_music

  def load_all_musics
    MusicAlbum.list_all_music_albums
  end

  def save_music
    file_m = FileManager.new
    file_m.musics = MusicAlbum.music_list
    file_m.save_music
  end
end
