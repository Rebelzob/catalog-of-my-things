require 'json'
require_relative '../models/book'


module BookData
  def save_books(books)
    File.open('database/books.json', 'w') do |file|
      file.puts books.map { |book|
        {
          id: book.id,
          publisher: book.publisher,
          publish_date: book.publish_date,
          cover_state: book.cover_state,
        }
      }.to_json
    end
  end

  def load_books
    books = []
    JSON.parse(File.read('database/books.json')).each do |book|
      books << Book.new(
        book['publisher'],
        book['publish_date'],
        book['cover_state'],
      )
    end
    books
  end
end
