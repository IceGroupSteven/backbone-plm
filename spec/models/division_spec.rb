require 'spec_helper'

describe Division do
  subject  { create(:knits) }

  context "associations" do
    it "has many companies through a join table" do
      subject.companies.create(attributes_for :company)
      expect(subject.company_divisions.size).to eq 1
    end

    it "has many users through its companies" do
      subject.companies.create(attributes_for :company)
      subject.companies.first.users.create(attributes_for :user)
      expect(subject.users.size).to eq 1
    end
  end
end
