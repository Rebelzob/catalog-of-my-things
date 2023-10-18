require_relative '../models/label'
require_relative '../models/item'

RSpec.describe Label do
  describe '#initialize' do
    it 'creates a new label with a unique id, title, color, and empty items array' do
      label = Label.new('Title', 'Color')
      expect(label.id).not_to be_nil
      expect(label.title).to eq('Title')
      expect(label.color).to eq('Color')
      expect(label.items).to eq([])
    end
  end

  describe '#add_item' do
    it 'adds an item to the label' do
      label = Label.new('Title', 'Color')
      item = Item.new('2021-01-01')
      label.add_item(item)
      item.add_label(label)
      expect(label.items).to eq([item])
    end
  end
end