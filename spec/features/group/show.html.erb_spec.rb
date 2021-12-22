require 'rails_helper'

RSpec.describe 'Groups', type: :feature do
  include Devise::Test::IntegrationHelpers
  let(:user) { User.create(name: 'TestUser1', email: 'Test@user1.com', password: 'password') }
  let(:group) do
    Group.create(name: 'Fast Food',
                 icon: 'https://Golden_Arches.svg.png', user: user)
  end
  let(:entity) { Entity.create(name: 'bicmac', amount: 10, group_ids: group.id) }

  describe '#show page' do
    before do
      sign_in user
      visit user_group_path(user, group)
    end

    it 'I can see the title of the page.' do
      expect(page).to have_content('TRANSACTIONS')
    end

    it 'I can see the total amount of transactions for selected category.' do
      expect(page).to have_content('Fast Food (total amount)')
    end

    it 'I can see a button that lets me add a new transaction' do
      expect(page).to have_link('ADD TRANSACTION')
    end

    it 'should redirect me to page for adding a new transaction' do
      click_link 'ADD TRANSACTION'
      expect(current_path).to eq(new_user_group_entity_path(user, group.id))
    end
  end
end
