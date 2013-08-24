Goal.where({ title: 'Become JavaScript ninja', description: 'I think title is really descriptive',year: 2013 }).first_or_create!
Goal.where({ title: 'Learn Ruby on intermediate level', description: 'I think title is really descriptive', year: 2013 }).first_or_create!

puts 'Yealy goals have been created!'


