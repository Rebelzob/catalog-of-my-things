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
          label: {
            id: book.label.id,
            title: book.label.title
            color: book.label.color
          },
          author: {
            id: book.author.id,
            first_name: book.author.first_name,
            last_name: book.author.last_name
          },
          genre: {
            id: book.genre.id,
            name: book.genre.name
          },
          source: {
            id: book.source.id,
            name: book.source.name
          }
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
        book['label'],
        book['author'],
        book['genre'],
        book['source']
      )
    end
    books
  end
end
