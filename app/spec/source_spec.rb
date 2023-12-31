require_relative '../models/source/source'
require_relative '../models/item'

describe Source do
  context 'Given a provided source' do
    before(:each) do
      Source.sources.clear # Clear sources list before each example
    end
    # params: name
    source = Source.new('Youtube')

    # initialize
    it 'Created the source with the correct parameters' do
      expect(source.name).to eql('Youtube')
    end

    # add_a_source
    it 'returns the source\'s correct name' do
      source = Source.new('New source')
      Source.add_a_source('source')
      expect(source.name).to eq('New source')
    end

    # list_all_sources
    it 'returns the correct list of all sources' do
      Source.list_all_sources

      output = puts('1 - Youtube')
      expect do
        Source.list_all_sources
      end.to output(output).to_stdout
    end

    # find a source by index
    it 'returns the correct source based on the provided index' do
      source = Source.new('Youtube')
      Source.sources.push(source)

      source_index = Source.find_source_by_index(0)
      expect(source_index.name).to eql('Youtube')
    end
  end

  # add_item(item)
  it 'returns the source\'s correct name and source' do
    source = Source.new('New source')
    item = Item.new('2023-01-01')
    source.add_item(item)
    item.add_label(source)
    expect(source.items).to eq([item])
  end
end
