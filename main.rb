require_relative 'app/user_data/label_data'
require_relative 'app/app'

def main
  app = App.new
  app.init
end

main
