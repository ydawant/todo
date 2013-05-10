# 40.times do 
#   Task.create(:task => Faker::Lorem.sentence(word_count = 20), :completed => false)
# end

# 10.times do 
#   User.create(:name => Faker::Name.name)
# end

# 20.times do
#   List.create(:name => Faker::Lorem.word, :user_id => rand(9)+1)
# end

# Task.all.each do |task|
# task.update_attributes(:list_id => rand(20)+1)
# end

# tag_opts = ["Bulbasaur", "Ivysaur", "Venusaur", "Charmander", "Charmeleon", "Charizard", "Squirtle", "Wartortle", "Blastoise"]
# tag_opts.each { |t| Tag.create(:tag_name => t) }

# 30.times do
#   Tagging.create(:task_id => rand(40)+1, :tag_id => rand(9)+1)
# end

