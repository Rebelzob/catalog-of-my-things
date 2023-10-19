require_relative 'book/book'

module Create
  def menu_create_book
    puts 'Enter the book publisher'
    publisher = gets.chomp
    puts 'Enter the book publish date'
    publish_date = gets.chomp
    puts 'Enter the book cover state'
    cover_state = gets.chomp
    book = Book.new(publisher, cover_state, publish_date)
    @books << book
    sleep(1)
    puts 'Book created successfully'
  end

  def menu_create_label
    puts 'Enter the label name'
    name = gets.chomp
    puts 'Enter color of the label'
    color = gets.chomp
    @labels << Label.new(name, color)
    sleep(1)
    puts 'Label created successfully'
  end
end
