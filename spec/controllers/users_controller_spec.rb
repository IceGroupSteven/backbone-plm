require 'spec_helper'

describe UsersController do
  before :each do
    user = mock_model User
    ApplicationController.any_instance.stub(:current_user).and_return(user)
    session[:user_id] = user.id
  end

  describe "#new" do
    it "renders the new template" do
      get :new
      expect(response).to render_template(:new)
    end

    it "assigns new user to @user" do
      get :new
      expect(assigns[:user]).to be_an_instance_of(User)
    end
  end

  describe "#create" do
    let(:user) { mock_model(User) }

    context "for invalid user" do
      it "renders the new template" do
        User.stub(:new).and_return(user)
        user.should_receive(:save).and_return(false)
        post :create, user: attributes_for(:user)
        expect(response).to render_template(:new)
      end
    end
  end
end
