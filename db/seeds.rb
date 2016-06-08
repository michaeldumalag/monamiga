require 'faker'

20.times do
  user = User.create!(username: Faker::Internet.user_name,
                      email: Faker::Internet.email,
                      password: "password")
end

for i in (1..20) do
  question = Question.create!(title: Faker::ChuckNorris.fact,
                              content: Faker::Hipster.paragraphs,
                              user_id: "#{i}")
end
