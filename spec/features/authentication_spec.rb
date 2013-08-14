require 'spec_helper'

feature 'Authentication' do

  before do
    @user = create(:user)
  end

  scenario 'after log in user can see log out link' do
    sign_in_and_go_to_root

    within '.top-bar' do
      expect(page).to have_content 'Sign out'
    end
  end

  scenario 'user can sign out' do
    sign_in_and_go_to_root

    click_link 'Sign out'
    within '.top-bar' do
      expect(page).to have_content 'Sign in'
    end
  end

  def sign_in_and_go_to_root
    sign_in @user
    visit root_path
  end

end