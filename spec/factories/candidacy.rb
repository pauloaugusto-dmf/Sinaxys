FactoryBot.define do
  factory :candidacy do
    user
    vacancy_id { Faker::Number.number(digits: 4) }
  end
end
