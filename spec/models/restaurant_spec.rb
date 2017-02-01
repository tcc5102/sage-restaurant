require 'rails_helper'

RSpec.describe Restaurant, type: :model do
  let(:user) { User.create!(email: "user@tester.com", password: "password") }
  let(:restaurant) { Restaurant.create!(title: "New Restaurant Title", rating: 5, last_visit: "2016-11-20", user: user) }

  it { is_expected.to belong_to(:user) }

  describe "attributes" do
    it "has title, rating, and last_visit attributes" do
      expect(restaurant).to have_attributes(title: "New Restaurant Title", rating: 5)
    end
  end
end
