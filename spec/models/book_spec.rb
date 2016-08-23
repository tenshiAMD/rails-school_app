require 'rails_helper'

RSpec.describe Book, type: :model do
  describe 'db' do
    it { should have_db_column(:name).of_type(:string) }
  end

  describe 'validations' do
    subject { build(:book) }

    it { should validate_presence_of(:name) }

    it { is_expected.to be_valid }
  end

  describe 'associations' do
    it { should have_many(:subject_books).dependent(:destroy) }
    it { should have_many(:subjects).through(:subject_books) }
  end
end
