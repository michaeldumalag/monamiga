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


# create user 'a' with example questions, answers, and responses:

User.create!(username: "a", email: "a", password: "a")

Question.create!(title: Faker::ChuckNorris.fact,
					 content: Faker::Hipster.paragraph,
					 user_id: 21)

Response.create!(respondable_id: 21, respondable_type: "Question", user_id: 21, content: Faker::Hipster.paragraph)

2.times do
	Answer.create!(question_id: 21, user_id: 21, content: Faker::Hipster.paragraph)
end

Response.create!(respondable_id: 1, respondable_type: "Answer", user_id: 21, content: Faker::Hipster.paragraph)
