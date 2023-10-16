require_relative 'app/user_data/author_data'
require_relative 'app/user_data/genre_data'
require_relative 'app/user_data/label_data'
require_relative 'app/user_data/source_data'
require_relative 'app/user_data/item_data'

class App
  include AuthorData
  include GenreData
  include LabelData
  include SourceData
  include ItemData

  def initialize
    collect_item_data
    source_data
    author_data
    genre_data
    label_data
