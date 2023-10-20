require_relative 'app/app'

def main
  app = App.new
  puts 'welcome!'
  app.init
end

main
