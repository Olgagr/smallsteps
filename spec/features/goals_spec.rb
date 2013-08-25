require 'spec_helper'

feature 'goals' do

  background do
    create(:goal)
    @user = create(:user)
    sign_in @user
    visit pages_goals_path
  end

  scenario 'after log in user can see list of goals', js: true do
    within '#main-region' do
      expect(page).to have_content 'Yearly goal'
    end
  end


end