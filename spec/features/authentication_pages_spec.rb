require 'spec_helper'

describe "User authentication" do
  describe "sign-in of existing user" do
    #TODO: implement this test once we have user flow determined
    pending
  end

  describe "sign-up for new users" do
    it "renders the sign-up form with errors with insufficient credentials" do
      visit '/'
      within(:css, ".new_user") do
        fill_in 'user[first_name]', with: "Matt"
        fill_in 'user[last_name]', with: "Campbell"
      end
      click_button 'SIGN UP'
      expect(page).to_not have_content 'Success'
      expect(page).to have_content(/Email can't be blank Password can't be blank/)
    end
  end
end
