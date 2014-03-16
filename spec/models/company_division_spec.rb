require 'spec_helper'

describe CompanyDivision do
  context "associations" do
    it { should belong_to(:company) }
    it { should belong_to(:division) }
  end
end
