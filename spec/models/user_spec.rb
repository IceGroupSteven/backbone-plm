require 'spec_helper'

describe User do
  let(:user)    { build(:user) }
  let(:admin)   { build(:admin) }
  let(:invalid) { build(:no_email_user) }

  context "associations" do
    let(:company)   { mock_model(Company) }
    let(:division)  { mock_model(Division) }

    it "belongs to a company" do
      user.company = company
      expect(user).to respond_to :company
      expect(user.company).to be company
    end

    it "has many divisions through its company" do
      user.company = create(:company)
      user.company.divisions.create(attributes_for :knits)
      expect(user.company).to respond_to :divisions
      expect(user.company.divisions.size).to eq 1
    end
  end

  context "validations" do
    it "should be valid with an email address" do
      expect(user).to be_valid
      expect(admin).to be_valid
    end

    it "should be invalid without an email address" do
      expect(invalid).to be_invalid
    end

    it "should be invalid without a password confirmation" do
      expect(build :no_password_confirmation).to be_invalid
    end

    it "should store an encrypted version of the user's password" do
      expect(user.password_digest).to eq "testing123"
      expect(user.password).to eq "testing123"
    end
  end

  context "#full_name" do
    it "returns a user object's full name" do
      expect(user.full_name).to eq "John Doe"
    end
  end
end
