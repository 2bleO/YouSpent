require 'rails_helper'

RSpec.describe 'User view', type: :feature do
  include Devise::Test::IntegrationHelpers

  describe '#home' do
    before { visit root_path }

    it { expect(page.body).to have_content('YouSpent') }
    it { expect(page.body).to have_button('LOG IN') }


    it 'should redirect me to Login page' do
      find_button('loginBtn').click
      expect(current_path).to eq(new_user_session_path)
    end

    it 'should redirect me to Signup page' do
      find_button('signupBtn').click
      expect(current_path).to eq(new_user_registration_path)
    end
  end
end
