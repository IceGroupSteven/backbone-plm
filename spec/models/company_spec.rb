require 'spec_helper'

describe Company do
  let(:company)    { create(:company) }

  context "associations" do
    it { should have_many(:users) }
    it { should have_many(:divisions).through(:company_divisions) }
  end
end
