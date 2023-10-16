def author_data
  print "Add the author's first name: "
  first_name = gets.chomp

  print "Add the author's last name: "
  last_name = gets.chomp

  author_data = { first_name, last_name }
end