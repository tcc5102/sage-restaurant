require 'rails_helper'
RSpec.describe RestaurantPicker do
  let(:picker) { RestaurantPicker.new }

  it "picks the most oldest, if it has 3 or more stars, and is older than a week" do
    r0 = Restaurant.new(title: "New Restaurant zero", rating: 1, last_visit: "2015-11-20")
    r1 = Restaurant.new(title: "New Restaurant one", rating: 1, last_visit: "2016-11-20")
    r2 = Restaurant.new(title: "New Restaurant two", rating: 2, last_visit: "2016-11-01")
    r3 = Restaurant.new(title: "New Restaurant three", rating: 2, last_visit: "2016-10-15")
    r4 = Restaurant.new(title: "New Restaurant four", rating: 4, last_visit: "2016-07-19")
    r5 = Restaurant.new(title: "New Restaurant five", rating: 5, last_visit: "2016-11-18")
    restaurants = [r0,r1,r2,r3,r4,r5]

    expect(picker.choose(restaurants)).to eq(r4).or(eq(r5))
  end
end
