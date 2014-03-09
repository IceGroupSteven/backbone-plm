require 'spec_helper'

describe UsersController do

  describe "GET #new" do
    it "should render new" do
      get :new
      expect(response).to render_template(:new)
    end

    it "should assign new company to @company" do
      get :new
      expect(assigns[:company]).to be_an_instance_of(Company)
    end
  end

  describe "POST #create" do
    let(:company_attrs) { attributes_for(:company) }

    it "renders error if company was not saved" do
      company = mock_model(Company)
      Company.stub(:new).and_return(company)
      company.should_receive(:save).and_return(false)
      post :create, company: company_attrs
      expect(response).to render_template(partial: '_errors')
    end

    context "with valid attributes" do
      it "renders the questionnaire partial via AJAX" do
        company = mock_model(Company)
        Company.stub(:new).and_return(company)
        company.should_receive(:save).and_return(true)

        xhr :post, :create, company: company_attrs
        expect(response).to render_template(partial: '_questionnaire')
      end

      it "redirects to company#new via ActionDispatch" do
        company = mock_model(Company)
        Company.stub(:new).and_return(company)
        company.should_receive(:save).and_return(true)

        post :create, company: company_attrs
        expect(response).to redirect_to company_path(company)
      end
    end

  end

end
