require 'rails_helper'

RSpec.describe Group, type: :model do
  describe 'associations' do
    it { should belong_to(:user) }
    it { should have_and_belong_to_many :entities }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
  end
end
