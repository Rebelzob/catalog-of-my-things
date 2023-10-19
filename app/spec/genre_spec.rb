require_relative '../models/genre/genre'
require_relative '../models/item'
require 'date'
require 'securerandom'

describe '#Genre' do
  SecureRandom.hex(10)
  let(:new_genre) { Genre.new('Fantasy') }
  let(:new_genre_item) { Genre.new('Comedy') }
  describe 'Initialize Genre with correct data' do
    it 'Genre name should be Fantasy' do
      expect(new_genre.name).to eq('Fantasy')
    end
  end

  describe '#add_item' do
    it 'Genre object should add new item to items property' do
      item = Item.new(Date.parse('18-10-2023'))
      new_genre.add_item(item)

      expect(new_genre.items).to include(item)
    end
  end

  describe '#add_genre' do
    it 'Genre object should add new genre to genre_list property' do
      new_genre_item.add_genre

      expect(Genre.genre_list).to include(new_genre_item)
    end
  end

  describe '#list_all_genres' do
    it 'Should list all genres' do
      expect { Genre.list_all_genres }.to output(puts('"0 - Comedy"')).to_stdout
    end
  end
end
