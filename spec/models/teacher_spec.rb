require 'rails_helper'

RSpec.describe Teacher, type: :model do
  describe 'db' do
    it { should have_db_column(:name).of_type(:string) }
  end

  describe 'validations' do
    subject { build(:teacher) }

    it { should validate_presence_of(:name) }

    it { is_expected.to be_valid }
  end

  describe 'associations' do
    it { should have_many(:subject_teachers).dependent(:destroy) }
    it { should have_many(:subjects).through(:subject_teachers) }

    it { should have_many(:students).through(:subjects) }
    it { should have_many(:books).through(:subjects) }
  end
end
