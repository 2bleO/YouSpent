require 'rails_helper'

RSpec.describe 'Group view', type: :feature do
  include Devise::Test::IntegrationHelpers
  let(:user) { User.create(name: 'TestUser1', email: 'Test@user1.com', password: 'password') }

  describe '#index' do
    before do
      Group.create(name: 'Fast Food', icon: 'https://upload.wikimedia.org/wikipedia/commons/thumb/3/36/McDonald%27s_Golden_Arches.svg/640px-McDonald%27s_Golden_Arches.svg.png', user: user)
      sign_in user
      visit user_groups_path(user)
    end

    context 'when rendering index page' do
      it { expect(page).to have_content('CATEGORIES') }
      it { expect(page).to have_content('Fast Food') }
    end

    context 'click on the button' do
      it 'should render to #new page' do
        click_link 'ADD CATEGORY'
        expect(current_path).to eq(new_user_group_path(user))
      end
    end
  end
end