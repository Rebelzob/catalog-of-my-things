require 'json'

module BookLabelData
  def save_books(books)
    return if books.empty?

    File.open('app/database/books.json', 'w') do |file|
      file.puts books.map { |book|
        {
          'id' => book.id,
          'publisher' => book.publisher,
          'publish_date' => book.publish_date,
          'cover_state' => book.cover_state
        }
      }.to_json
    end
    puts 'Books saved sucessfuly!'
  end

  def save_labels(labels)
    return if labels.empty?

    File.open('app/database/labels.json', 'w') do |file|
      file.puts labels.map { |label|
        {
          'id' => label.id,
          'title' => label.title,
          'color' => label.color
        }
      }.to_json
    end
    puts 'Labels saved sucessfuly!'
  end

  def load_books
    return [] unless File.exist?('app/database/books.json')

    books = []
    JSON.parse(File.read('app/database/books.json')).each do |book|
      books << Book.new(
        book['publisher'],
        book['publish_date'],
        book['cover_state']
      )
    end
    books
  rescue StandardError => e
    puts "Error loading Books: #{e.message}"
  end

  def load_labels
    return [] unless File.exist?('app/database/labels.json')

    labels = []
    JSON.parse(File.read('app/database/labels.json')).each do |label|
      labels << Label.new(
        label['title'],
        label['color']
      )
    end
    labels
  rescue StandardError => e
    puts "Error loading Books: #{e.message}"
  end
end
