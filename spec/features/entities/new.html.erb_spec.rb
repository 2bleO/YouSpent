require 'rails_helper'

RSpec.describe 'MoneyTrack view', type: :feature do
  include Devise::Test::IntegrationHelpers
  let(:user) { User.create(name: 'TestUser1', email: 'Test@user1.com', password: 'password') }
  let(:group) { Group.create(name: 'Fast Food', icon: 'https://upload.wikimedia.org/wikipedia/commons/thumb/3/36/McDonald%27s_Golden_Arches.svg/640px-McDonald%27s_Golden_Arches.svg.png', user: user) }
 
  describe '#index' do
    before do
      sign_in user
      visit new_user_group_entity_path(user, group)
    end

    it { expect(page).to have_content('NEW TRANSACTION') }

    it 'I can see the title of the page.' do
      expect(page).to have_content('NEW TRANSACTION')
    end

    it 'should have input field for adding a name' do
      expect(page).to have_field("Transaction name")
    end

    it 'should have input field for adding an amount' do
      expect(page).to have_field("Amount")
    end
  end
end
