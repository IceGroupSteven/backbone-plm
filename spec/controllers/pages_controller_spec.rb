require 'spec_helper'

describe PagesController do
  before :each do
    user = mock_model User
    ApplicationController.any_instance.stub(:current_user).and_return(user)
  end

  describe "#dashboard" do
    it "renders the dashboard template" do
      get :dashboard
      expect(response).to render_template(:dashboard)
    end
  end
end
