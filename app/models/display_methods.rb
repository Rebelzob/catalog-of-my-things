module Display
  def list_of_books
    if @books.empty?
      puts 'No books available to display'
    else
      @books.each.with_index do |book, index|
        puts "#{index}) ID: #{book.id} The book: #{book.label.title} by #{book.author.full_name} " \
             "published by #{book.publisher} on #{book.publish_date} with cover state: #{book.cover_state}"
      end
    end
  end

  def list_labels
    if @labels.empty?
      puts 'No labels available to display'
    else
      @labels.each.with_index do |label, index|
        puts "#{index}) ID: #{label.id} Label: #{label.title}"
      end
    end
  end
end
