FactoryGirl.define do
  factory :subject_student do
    association :subject
    association :student
  end
end
