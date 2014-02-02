require 'spec_helper'

describe "User authentication" do
  before :each do
    build(:user)
    build(:no_password_confirmation)
  end

  describe "the signin process", :type => :feature do
    pending
    #TODO: implement this test once we have user flow determined
    # it "signs me in" do
    #   visit '/sessions/new'
    #   within("#session") do
    #     fill_in 'Login', :with => 'user@example.com'
    #     fill_in 'Password', :with => 'password'
    #   end
    #   click_link 'Sign in'
    #   expect(page).to have_content 'Success'
    # end
  end

  describe "the signup process" do
    it "renders the signup form with errors with insufficient credentials" do
      visit '/users/new'
      within(".sign-up") do
        fill_in 'First name', with: "Matt"
        fill_in 'Last name', with: "Campbell"
      end
      click_link 'SIGN UP'
      expect(page).to_not have_content 'Success'
      expect(page).to have_content('div.alert.alert-error')
    end
  end
end
