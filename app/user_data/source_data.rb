module SourceData
  def source_data
    print 'Add a source name: '
    name = gets.chomp

    { name: name }
  end
end
