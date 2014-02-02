require 'spec_helper'

describe User do
  let(:user)    { build(:user) }
  let(:admin)   { build(:admin) }

  describe "initializes users with unique email" do
    it { should have_secure_password }
    it { should validate_presence_of(:email) }

    # Opted out of Shoulda gem syntax below for unique email validation due to known bugs when also using has_secure_password
    context "unique email" do
      it "should validate uniqueness of email" do 
        expect(create(:user)).to be_valid
      end
    end

    context "non-unique email" do
      it "should validate uniqueness of email" do 
        create(:user, email: "test@example.com" )
        expect(build(:user, email: "TEST@example.com" )).not_to be_valid
      end
    end
  end

  describe '#full_name' do
    it 'returns full name' do |s|
      expect(user).to be_named user.full_name
    end
  end
end
