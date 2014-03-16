require 'spec_helper'

describe PagesController do
  before :each do
    ApplicationController.any_instance.stub(:current_user).and_return(user)
  end

  let(:user) { mock_model(User) }

  describe "#dashboard" do
    it "renders the dashboard template" do
      get :dashboard

      expect(response).to render_template(:dashboard)
    end

    it "assigns the current user to the user instance variable" do
      get :dashboard

      expect(assigns(:user)).to eq(user)
    end
  end
end
