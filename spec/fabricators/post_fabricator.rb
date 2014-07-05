Fabricator(:post)do
  title { Faker::Lorem.sentences.join(' ') }
  description { Faker::Lorem.paragraph }
end
