require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { User.create!(email: "user@tester.com", password: "password") }

  # Shoulda tests for email
  it { is_expected.to validate_presence_of(:email) }

  # Shoulda tests for password
  it { is_expected.to validate_presence_of(:password) }


  describe "attributes" do
    it "should have name and email attributes" do
      expect(user).to have_attributes(email: user.email)
    end
  end
end
