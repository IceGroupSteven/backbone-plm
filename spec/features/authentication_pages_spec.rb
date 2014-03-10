require 'spec_helper'

feature "User authentication" do
  scenario "sign-in of existing user" do
    user = user(:create)
    sign_in(user)
    expect(page).to have_content(/Dashboard/)
  end

  scenario "sign-in of invalid user" do
    visit root_path
    within(:css, ".sign-in") do
      fill_in 'user[email]', with: "pl@tip.us"
      fill_in 'user[password]', with: "testing123"
    end
    click_button 'Sign In'
    expect(page).to have_content(/Email or password is invalid/)
  end
end
