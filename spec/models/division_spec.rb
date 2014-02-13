require 'spec_helper'

describe Division do
  subject  { create(:knits) }

  context "associations" do
    it { should have_many(:companies).through(:company_divisions) }
    it { should have_many(:users).through(:companies) }
  end
end
