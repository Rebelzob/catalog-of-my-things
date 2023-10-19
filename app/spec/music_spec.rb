require_relative '../models/music/music'
require_relative '../models/game/author'
require_relative '../models/label'
require 'date'
require 'securerandom'

describe '#MusicAlbum' do
  publish_date = Date.parse('18-10-2023')
  let(:new_music) { MusicAlbum.new(true, publish_date) }
  describe 'Initialize MusicAlbum with correct data' do
    it 'MusicAlbum date should be 18-10-2023' do
      expect(new_music.publish_date).to eq(publish_date)
    end

    it 'MusicAlbum on_spotify should be true' do
      expect(new_music.on_spotify).to eq(true)
    end
  end

  describe '#add_music_album' do
    it 'MusicAlbum object should add new music to music_list property' do
      id = SecureRandom.hex(10)
      music = MusicAlbum.new(true, Date.parse('15-10-2023'))
      music.add_author(Author.new('Bruno', 'Kambere'))
      music.add_label(Label.new('Dunot', 'Red'))
      music.add_source(double(id: id, name: 'Source', items: []))
      music.add_music_album
      output = puts('"0 - [MusicAlbum], Bruno, Dunot, Source, 2023-10-15"')
      expect do
        MusicAlbum.list_all_music_albums
      end.to output(output).to_stdout
    end
  end
end
