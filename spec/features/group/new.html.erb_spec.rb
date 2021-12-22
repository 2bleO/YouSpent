require 'rails_helper'

RSpec.describe 'Group view', type: :feature do
  include Devise::Test::IntegrationHelpers
  let(:user) { User.create(name: 'TestUser1', email: 'Test@user1.com', password: 'password') }

  describe '#index' do
    before do
      sign_in user
      visit new_user_group_path(user)
    end

    it 'I can see the title of the page.' do
      expect(page).to have_content('NEW CATEGORY')
    end

    it 'should have input field' do
      expect(page).to have_selector("input")
    end

    it 'should add a new category' do
        fill_in 'Group Name', with: 'Entertainment'
        fill_in 'Icon URL', with: 'https://upload.wikimedia.org/wikipedia/commons/thumb/3/36/McDonald%27s_Golden_Arches.svg/640px-McDonald%27s_Golden_Arches.svg.png'
        click_button 'Save'
        expect(current_path).to eq(user_groups_path(user))
    end
  end
end
