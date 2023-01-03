300.times do
  Post.create(title: Faker::Lorem.sentence, body: Faker::Lorem.paragraph, excerpt: Faker::Lorem.paragraph)
end
