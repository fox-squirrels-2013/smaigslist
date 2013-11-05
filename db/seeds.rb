require 'faker'




15.times do |i|
  Category.create! name: Faker::Lorem.word
end

100.times do |i|
  Post.create category_id:   Category.all.sample.id,
              title:         Faker::Lorem.word * 2,
              description:   Faker::Lorem.word * 5,
              price:         rand(100..1000),
              contact_email: Faker::Internet.email
end


