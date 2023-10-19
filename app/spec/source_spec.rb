require_relative '../models/source'

describe Source do
  context 'Given a provided source' do
    # params: name
    source = Source.new('Youtube')

    # initialize
    it 'Created the source with the correct parameters' do
      expect(source.name).to eql('Youtube')
    end

    # add_a_source
    it "returns the source's correct title and source" do
      source_data = {
        name: 'Movie club'
      }
      source.add_a_source(source_data)
      new_source = source.list_all_sources.first

      expect(new_source.name).to eql('Movie club')
    end

    # list_all_sources
    it 'returns the correct list of all sources' do
      sources = Source.list_all_sources

      expect(sources).to be_an(Array)
      expect(sources.first).to be_a(Source)
      expect(sources.map(&:name)).to include('Youtube', 'Movie club')
    end

    # find a source by index
    it 'returns the correct source based on the provided index' do
      source_index = Source.find_source_by_index(0)
      expect(source_index.name).to eql('Youtube')
    end
  end

  # add_item(item)
  it 'adds the source to the item' do
    item = Item.new('Sample Item', 'Sample Source', '2023-10-15', true)
    source.add_item(item)
    expect(item.source).to eql(source)
  end
end
