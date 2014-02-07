require 'spec_helper'

describe UsersController do

  describe "#new" do
    it "should render new" do
      get :new
      expect(response).to render_template(:new)
    end

    it "should assign new user to @user" do
      get :new
      expect(assigns[:user]).to be_an_instance_of(User)
    end
  end

  describe "#create" do
    let(:user_attrs) { attributes_for(:user) }

    it "should render if user was not saved" do
      user = mock_model(User)
      User.stub(:new).and_return(user)
      user.should_receive(:save).and_return(false)
      post :create, user: user_attrs
      expect(response).to render_template(partial: '_errors')
    end

    context "successful user creation" do
      it "via AJAX should render the questionnaire partial" do
        user = mock_model(User)
        User.stub(:new).and_return(user)
        user.should_receive(:save).and_return(true)

        xhr :post, :create, user: user_attrs
        expect(response).to render_template(partial: '_questionnaire')
      end

      it "via ActionDispatch should redirect to the new user view" do
        user = mock_model(User)
        User.stub(:new).and_return(user)
        user.should_receive(:save).and_return(true)

        post :create, user: user_attrs
        expect(response).to redirect_to user_path(user)
      end
    end
  end

end
