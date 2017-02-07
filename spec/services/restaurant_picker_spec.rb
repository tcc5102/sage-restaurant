require 'rails_helper'
RSpec.describe RestaurantPicker do
  let(:picker) { RestaurantPicker.new }
  let(:todays_date) { DateTime.now }

  describe "#choose" do
    it "picks a random restaurant, if it has 3 or more stars, and is older than a week" do
      r0 = Restaurant.new(title: "New Restaurant zero", rating: 1, last_visit: todays_date - 6.days)
      r1 = Restaurant.new(title: "New Restaurant one", rating: 1, last_visit: todays_date - 5.days)
      r2 = Restaurant.new(title: "New Restaurant two", rating: 3, last_visit: todays_date - 1.days)
      r3 = Restaurant.new(title: "New Restaurant three", rating: 2, last_visit: todays_date - 20.days)
      r4 = Restaurant.new(title: "New Restaurant four", rating: 4, last_visit: todays_date - 10.days)
      r5 = Restaurant.new(title: "New Restaurant five", rating: 5, last_visit: todays_date - 14.days)
      restaurants = [r0,r1,r2,r3,r4,r5]

      expect(picker.choose(restaurants)).to eq(r4).or(eq(r5))
    end

    it "does not choose a restaurant if they are all under 3 stars" do
      r0 = Restaurant.new(title: "New Restaurant zero", rating: 1, last_visit: todays_date - 7.days)
      r1 = Restaurant.new(title: "New Restaurant one", rating: 1, last_visit: todays_date - 14.days)
      r2 = Restaurant.new(title: "New Restaurant two", rating: 2, last_visit: todays_date - 10.days)
      restaurants = [r0,r1,r2]

      expect(picker.choose(restaurants)).to eq(nil)
    end

    it "does not choose a restaurant if they have been visited within one week" do
      r0 = Restaurant.new(title: "New Restaurant zero", rating: 4, last_visit: todays_date - 5.days)
      r1 = Restaurant.new(title: "New Restaurant one", rating: 3, last_visit: todays_date - 2.days)
      r2 = Restaurant.new(title: "New Restaurant two", rating: 5, last_visit: todays_date - 6.days)
      restaurants = [r0,r1,r2]

      expect(picker.choose(restaurants)).to eq(nil)
    end
  end
end
