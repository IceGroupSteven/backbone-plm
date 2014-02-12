require 'spec_helper'

describe Company do
  let(:company)    { create(:company) }

  context "associations" do
    it "has many users" do
      user = company.users.build(attributes_for :user)
      expect(user).to be_valid
      expect(company.users.size).to eq 1
      expect(company.users.first.full_name).to eq "John Doe"
    end

    it "has many divisions through a join table" do
      division = company.divisions.create(attributes_for :knits)
      expect(company.company_divisions.size).to eq 1
    end
  end
end
