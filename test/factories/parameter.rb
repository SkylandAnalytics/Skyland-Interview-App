FactoryBot.define do
  factory :parameter, class: Parameter do
    measurement { Faker::Number.between(from: -5, to: 50.3) }
  end
end
