require 'spec_helper'

describe SessionsController do

  describe "GET 'new'" do
    render_views
    it "renders the login page" do
      get 'new'
      expect(response).to render_template :new
      expect(response.body).to include "Login"
    end
  end

  describe "POST 'create'" do
    it "redirects to the dashboard if successful" do
      pending "Make sure to stub User model"
      post 'create'
      expect(response).to render_template :new
    end

    it "renders the new template with flash message if not successful" do
      pending "Try to stub the HTTP request as well"
      post 'create'
      expect(response).to render_template :new
    end
  end

  describe "DELETE 'destroy'" do
    it "returns http success" do
      pending "Successful session deletion should mean no session"
      post 'destroy'
    end
  end

end
