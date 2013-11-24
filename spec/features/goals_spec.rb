require 'spec_helper'

feature 'goals' do

  background do
    @today = Time.now
    week_number = Date.today.sunday? ? Date.today.cweek+1 : Date.today.cweek
    create(:goal, type: 'WeeklyGoal', year: @today.year, month: @today.month, week: week_number, title: 'Correct tests in SmallSteps app')
    @user = create(:user)
    sign_in @user
    visit pages_goals_path
  end

  scenario 'after log in user can see list of goals', js: true do
    within '#goals-content-region' do
      expect(page).to have_content 'Correct tests in SmallSteps app'
    end
  end

  scenario 'user can see yearly goals', js: true do
    create(:goal, year: @today.year, title: 'Become well-grounded Rubyist')
    within '#goals-nav-region' do
      click_link 'Yearly'
    end
    within '#goals-content-region' do
      expect(page).to have_content 'Become well-grounded Rubyist'
    end
  end

  scenario 'user can see monthly goals', js: true do
    create(:goal, type: 'MonthlyGoal', year: @today.year, month: @today.month, title: 'Read Rebuilding Rails')
    within '#goals-nav-region' do
      click_link 'Monthly'
    end
    within '#goals-content-region' do
      expect(page).to have_content 'Read Rebuilding Rails'
    end
  end

  scenario 'user can see weekly goals', js: true do
    within '#goals-nav-region' do
      click_link 'Weekly'
    end
    within '#goals-content-region' do
      expect(page).to have_content 'Correct tests in SmallSteps app'
    end
  end

  scenario 'user can add goal', js: true do
    within '#goals-nav-region' do
      click_link 'Yearly'
    end
    click_link 'Add Goal'
    within '#modal-region' do
      fill_in 'goal-title', with: 'Become well-grounded Rubyist'
      fill_in 'goal-description', with: 'This is very important goal for me.'
      click_button 'Save'
    end
    within '#goals-content-region' do
      expect(page).to have_content 'Become well-grounded Rubyist'
    end
  end

  scenario 'user can edit goal', js: true do
    within '#goals-content-region' do
      click_button 'Edit'
    end
    within '#modal-region' do
      fill_in 'goal-title', with: 'Correct all tests in SmallSteps app'
      click_button 'Save'
    end
    expect(page).to have_content 'Correct all tests in SmallSteps app'
  end

  scenario 'user can delete a goal', js: true do
    within '#goals-content-region' do
      click_button 'Delete'
    end
    within '#modal-region' do
      click_button 'Delete'
    end
    expect(page).to have_content 'No goals so far. Go ahead and add a new one!'
  end

  scenario 'user can set goal as finished', js: true do
    within '#goals-content-region' do
      check 'finished'
      expect(page).to have_css '.finished'
      expect(page).to have_css 'button[data-action="delete"][disabled]'
      expect(page).to have_css 'button[data-action="edit"][disabled]'
    end
  end

end