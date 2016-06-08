require 'faker'

20.times do
  user = User.create!(username: Faker::Internet.user_name,
                      email: Faker::Internet.email,
                      password: "password")
end

for user_id in (User.minimum(:id)..User.maximum(:id)) do
  question = Question.create!(title: Faker::ChuckNorris.fact,
                              content: Faker::Hipster.paragraph,
                              user_id: user_id)
end
