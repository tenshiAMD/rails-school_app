FactoryGirl.define do
  factory :student do
    sequence(:name) { |n| "#{Faker::Lorem.word} #{n}" }
  end
end
