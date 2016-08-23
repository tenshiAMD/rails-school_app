require 'rails_helper'

RSpec.describe Student, type: :model do
  describe 'db' do
    it { should have_db_column(:name).of_type(:string) }
  end

  describe 'validations' do
    subject { build(:student) }

    it { should validate_presence_of(:name) }

    it { is_expected.to be_valid }
  end

  describe 'associations' do
    it { should have_many(:subject_students).dependent(:destroy) }
    it { should have_many(:subjects).through(:subject_students) }

    it { should have_many(:teachers).through(:subjects) }
    it { should have_many(:books).through(:subjects) }
  end
end
