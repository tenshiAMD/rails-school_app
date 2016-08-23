FactoryGirl.define do
  factory :book do
    sequence(:name) { |n| "#{Faker::Lorem.word} #{n}" }
  end
end
