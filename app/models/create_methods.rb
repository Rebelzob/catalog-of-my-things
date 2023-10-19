require_relative 'book/book'
require_relative 'label'

module Create
  def menu_create_book
    puts 'Enter the book publisher'
    publisher = gets.chomp
    puts 'Enter the book publish date'
    publish_date = gets.chomp
    puts 'Enter the book cover state'
    cover_state = gets.chomp
    book = Book.new(cover_state, publisher, publish_date)
    @books << book
    sleep(1)
    puts 'Book created successfully'
  end

  def menu_create_label
    puts 'Enter the label name'
    title = gets.chomp
    puts 'Enter color of the label'
    color = gets.chomp
    label = Label.new(title, color)
    @labels << label
    sleep(1)
    puts 'Label created successfully'
  end
end
