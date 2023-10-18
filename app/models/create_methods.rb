require_relative 'book/book'

module Create
  def create_book
    puts 'Enter the book title'
    title = gets.chomp
    puts 'Enter the book author'
    author = gets.chomp
    puts 'Enter the book publisher'
    publisher = gets.chomp
    puts 'Enter the book genre'
    genre = gets.chomp
    puts 'Enter the book source'
    source = gets.chomp
    puts 'Enter the book cover state'
    cover_state = gets.chomp
    puts 'Enter the book publish date'
    publish_date = gets.chomp
    Book.new(title, author, publisher, genre, source, cover_state, publish_date)
    sleep(1)
    puts 'Book created successfully'
  end
end
