FactoryGirl.define do
  factory :subject do
    sequence(:name) { |n| "#{Faker::Lorem.word} #{n}" }
  end
end
