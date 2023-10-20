require_relative 'music'

module MusicMenu
  def menu_create_music
    puts 'Enter the publish date [YYYY-MM-DD]'
    publish_date = gets.chomp
    puts 'On spotify? [y/n]'
    on_spotify = gets.chomp.downcase
    on_spotify = on_spotify == 'y'
    my_music = MusicAlbum.new(on_spotify, publish_date)
    my_music.add_music_album
    puts 'MusicAlbum created successfully'
  end
end
