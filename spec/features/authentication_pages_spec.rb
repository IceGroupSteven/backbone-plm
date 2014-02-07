require 'spec_helper'

feature "Sign-in for existing user" do
  scenario "with invalid credentials" do
    #TODO: implement this test once we have user flow determined
    #TODO: make use of stubbed user objects
    pending
  end

  scenario "with valid credentials" do
    pending
  end
end

feature "Sign-up for new users" do
  scenario "renders the sign-up form with errors with insufficient credentials" do
    visit '/'
    within(:css, ".new_user") do
      fill_in 'user[first_name]', with: "Matt"
      fill_in 'user[last_name]', with: "Campbell"
    end
    click_button 'SIGN UP'
    expect(page).to_not have_content 'Success'
    expect(page).to have_content(/Email can't be blank Password can't be blank/)
  end

  scenario "renders the questionnaire (for sign-up part 2) with proper credentials" do
    pending
  end
end
