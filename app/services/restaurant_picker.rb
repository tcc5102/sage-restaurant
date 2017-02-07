class RestaurantPicker

  def choose(restaurants)
    restaurants.select { |restaurant| restaurant if qualified(restaurant) }.sample
  end

  private

  def qualified(restaurant)
    (restaurant.last_visit < 1.week.ago && restaurant.rating > 2)
  end
end
