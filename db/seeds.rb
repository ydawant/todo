40.times do 
  Task.create(:task => Faker::Lorem.sentence(word_count = 20), :completed => false)
end
