FactoryGirl.define do
  factory :teacher do
    sequence(:name) { |n| "#{Faker::Lorem.word} #{n}" }
  end
end
