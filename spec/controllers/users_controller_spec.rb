require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let(:user) { User.create!(email: "user@tester.com", password: "password", password_confirmation: "password") }
  let(:restaurant) { Restaurant.create!(title: "New Restaurant Title", rating: 5, last_visit: "2016-11-20", user: user) }

  describe "GET show" do
    it "returns http success" do
      get :show, user_id: user.id, id: restaurant.id
      expect(response).to have_http_status(:success)
    end
  end
end
