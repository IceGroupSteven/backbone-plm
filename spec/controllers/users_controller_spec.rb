require 'spec_helper'

describe UsersController do

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

      it "displays validation errors on the user" do
        post :create, user: attributes_for(:invalid_user)
        expect(response).to render_template(:new)
      end
    end

    it "redirects to the questionnaire page if the user was persisted" do
      User.stub(:new).and_return(user)
      user.should_receive(:save).and_return(true)

      post :create, user: attributes_for(:user)
      expect(response).to redirect_to user_questionnaire_path(user)
    end

    context "existing user that failed to complete the questionnaire" do
      it "is routed to the questionnaire upon next login attempt" do
        pending "Maybe use a wizard form for this..."
      end
    end
  end

  describe "#questionnaire" do
    let(:user) { create(:user) }

    it "renders the questionnaire template" do
      get :questionnaire, user_id: user.id
      expect(response).to render_template(:questionnaire)
    end
  end
end
