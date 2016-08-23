require 'rails_helper'

RSpec.describe Subject, type: :model do
  describe 'db' do
    it { should have_db_column(:name).of_type(:string) }
  end

  describe 'validations' do
    subject { build(:subject) }

    it { should validate_presence_of(:name) }

    it { is_expected.to be_valid }
  end

  describe 'associations' do
    it { should have_many(:subject_books).dependent(:destroy) }
    it { should have_many(:books).through(:subject_books) }

    it { should have_many(:subject_teachers).dependent(:destroy) }
    it { should have_many(:teachers).through(:subject_teachers) }

    it { should have_many(:subject_students).dependent(:destroy) }
    it { should have_many(:students).through(:subject_students) }
  end
end
