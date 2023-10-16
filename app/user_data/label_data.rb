def label_data
  print "Add a label title: "
  title = gets.chomp

  print "Add a label color: "
  color = gets.chomp

  label_data = { title, color }
end