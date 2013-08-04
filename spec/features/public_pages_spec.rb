require 'spec_helper'

feature 'Public pages' do

  scenario 'user can visit home page' do
    visit root_path
    expect(page).to have_content 'Welcome! This is small steps app.'
  end

  scenario 'user can visit sign in page' do
    visit root_path
    click_link 'Sign in'

    expect(page).to have_css 'input#user_email'
    expect(page).to have_css 'input#user_password'
    expect(page).to have_css 'input[value="Sign in"]'

    within 'h2' do
      expect(page).to have_content 'Sign in'
    end
  end

  scenario 'user can visit sign up page' do
    visit root_path
    click_link 'Sign up'

    expect(page).to have_css 'input#user_email'
    expect(page).to have_css 'input#user_password'
    expect(page).to have_css 'input#user_password_confirmation'
    expect(page).to have_css 'input[value="Sign up"]'

    within 'h2' do
      expect(page).to have_content 'Sign up'
    end
  end

  scenario 'user can go to home page clicking on the logo' do
    visit new_user_session_path
    within '.title-area .name' do
      click_link 'SmallSteps'
    end
    expect(page).to have_content 'Welcome! This is small steps app.'
  end

end