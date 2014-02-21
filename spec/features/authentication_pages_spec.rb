require 'spec_helper'

feature "User authentication" do
  # scenario "sign-in of existing user" do
    #TODO: implement this test once we have user flow determined
  #   pending
  # end

  scenario "no password or email provided" do
    visit root_path
    within(:css, ".new_user") do
      fill_in 'user[first_name]', with: "Matt"
      fill_in 'user[last_name]', with: "Campbell"
    end
    click_button 'SIGN UP'
    expect(page).to_not have_content 'Success'
    expect(page).to have_content(/Email can't be blank Password can't be blank/)
  end

  scenario "adds a new user" do
    visit root_path
    within(:css, ".new_user") do
      fill_in 'user[first_name]', with: "Matt"
      fill_in 'user[last_name]', with: "Campbell"
      fill_in 'user[email]', with: "matt@example.com"
      fill_in 'user[password]', with: "password123"
      fill_in 'user[password_confirmation]', with: "password123"
    end
    click_button 'SIGN UP'
    expect(page).to have_content(/Welcome to BPLM/)
    expect(page).to have_content 'Matt Campbell'
  end
end
