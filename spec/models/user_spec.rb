require 'spec_helper'

describe User do
  let(:user)    { build(:user) }
  let(:admin)   { build(:admin) }
  let(:invalid) { build(:user, :email => nil) }

  it "should be valid with an email address" do
    expect(user).to be_valid
    expect(admin).to be_valid
  end

  it "should be invalid without an email address" do
    expect(invalid).to be_invalid
  end
end

