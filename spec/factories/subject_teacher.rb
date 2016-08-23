FactoryGirl.define do
  factory :subject_teacher do
    association :subject
    association :teacher
  end
end
