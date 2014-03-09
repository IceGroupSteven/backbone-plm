require "spec_helper"

describe ApplicationController do
  controller do
    def index
      redirect_to "/login"
    end
  end

  describe "#authorize" do

    let(:user) do
      mock_model User, id: 1
    end

    it "triggers a callback to the authorize method" do
      current_user = nil
      get :index
      expect(response).to redirect_to new_session_path
    end

    it "is not triggered when there is a current user" do
      ApplicationController.any_instance.stub(:current_user).and_return(user)
      get :index
      expect(response).to redirect_to "/login"
    end
  end
end
