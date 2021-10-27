FactoryBot.define do
  factory :process_step, class: ProcessStep do
    name { Faker::Science.element }
    description { Faker::Restaurant.description }
    position { Faker::Number.between(from: 1, to: 5) }
  end
end
