require_relative '../models/game/author'
require 'rspec'

describe Author do
  let(:author) { Author.new('Javier', 'Aybar') }

  describe 'Create new Author with correct data' do
    it 'should create a new Author' do
      expect(author).to be_an_instance_of(Author)
    end

    it 'first_name should be Javier' do
      expect(author.first_name).to eq('Javier')
    end

    it 'Last_name should be Aybar' do
      expect(author.last_name).to eq('Aybar')
    end

    describe '#add_item' do
      it 'should add the current item to items' do
        item = double('item')
        expect(item).to receive(:author=).with(author)
        
        author.add_item(item)
        
        expect(author.items).to include(item)
      end
    end
  end
end