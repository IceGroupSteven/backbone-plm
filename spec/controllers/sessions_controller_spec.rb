require 'spec_helper'

describe SessionsController do
  let(:user) { double("User", id: 1) }

  describe "GET 'new'" do
    render_views
    it "renders the login page" do
      get :new
      expect(response).to render_template :new
      expect(response.body).to include "Login"
    end
  end

  describe "POST 'create'" do
    let(:params) do
      { email: "test@email.com", password: "anything" }
    end

    context "with valid credentials" do
      it "redirects to the dashboard" do
        expect(User).to receive(:find_by_email).with(params[:email]).and_return(user)
        expect(user).to receive(:authenticate).with(params[:password]).and_return(true)

        post :create, params
        expect(response).to redirect_to root_url
      end
    end

    context "with invalid credentials" do
      it "renders the new template with flash message if not successful" do
        expect(User).to receive(:find_by_email).with(params[:email]).and_return(user)
        expect(user).to receive(:authenticate).with(params[:password]).and_return(false)

        post :create, params
        expect(response).to render_template :new
      end
    end
  end

  describe "DELETE 'destroy'" do
    it "returns HTTP success" do
      session[:user_id] = 1
      delete :destroy

      expect(session[:user_id]).to be_nil
    end
  end

end
