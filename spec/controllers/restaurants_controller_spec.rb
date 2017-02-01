require 'rails_helper'

RSpec.describe RestaurantsController, type: :controller do
  let(:user) { User.create!(email: "user@tester.com", password: "password") }
  let(:restaurant) { Restaurant.create!(title: "New Restaurant Title", rating: 5, last_visit: "2016-11-20", user: user) }

  describe "GET index" do
    it "returns http success" do
      get :index, user_id: user.id, id: restaurant.id
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET edit" do
    it "returns http redirect" do
      get :edit, user_id: user.id, id: restaurant.id
      expect(response).to have_http_status(:success)
    end
  end

  describe "Restaurant create" do
    it "increases the number of Restaurants by 1" do
      Restaurant.create!(title: "Test Restaurant Title", rating: 5, last_visit: "2016-11-20", user: user)
      expect(Restaurant.count).to eq(1)
    end
  end
end
