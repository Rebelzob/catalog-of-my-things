require_relative '../models/book/book'

RSpec.describe Book do
  describe '#initialize' do
    it 'creates a new book with a unique id, publish date, cover state, publisher, and not archived' do
      book = Book.new('good', 'Publisher', '2021-01-01')
      expect(book.id).not_to be_nil
      expect(book.publish_date).to eq('2021-01-01')
      expect(book.cover_state).to eq('good')
      expect(book.publisher).to eq('Publisher')
      expect(book.archived).to be_falsey
    end
  end

  describe '#add_label' do
    it 'adds a label to the book' do
      book = Book.new('good', 'Publisher', '2021-01-01')
      label = Label.new('Title', 'Color')
      book.add_label(label)
      expect(book.label).to eq(label)
    end
  end

  describe '#add_genre' do
    it 'adds a genre to the book' do
      book = Book.new('good', 'Publisher', '2021-01-01')
      genre = Genre.new('Science Fiction')
      expect(book.genre).to eq('Science Fiction')
    end
  end

  describe '#add_author' do
    it 'adds an author to the book' do
      book = Book.new('good', 'Publisher', '2021-01-01')
      book.add_author('Isaac Asimov')
      expect(book.author).to eq('Isaac Asimov')
    end
  end

  describe '#add_source' do
    it 'adds a source to the book' do
      book = Book.new('good', 'Publisher', '2021-01-01')
      book.add_source('Amazon')
      expect(book.source).to eq('Amazon')
    end
  end

  describe '#move_to_archive' do
    context 'when the book can be archived' do
      it 'archives the book' do
        book = Book.new('good', 'Publisher', '2010-01-01')
        book.move_to_archive
        expect(book.archived).to be_truthy
      end
    end

    context 'when the book cannot be archived' do
      it 'does not archive the book' do
        book = Book.new('good', 'Publisher', '2021-01-01')
        book.move_to_archive
        expect(book.archived).to be_falsey
      end
    end

    context 'when the book has a bad cover state' do
      it 'archives the book' do
        book = Book.new('bad', 'Publisher', '2010-01-01')
        book.move_to_archive
        expect(book.archived).to be_truthy
      end
    end
  end
end
