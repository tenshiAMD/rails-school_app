FactoryGirl.define do
  factory :subject_book do
    association :subject
    association :book
  end
end
