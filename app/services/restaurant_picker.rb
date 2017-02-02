class RestaurantPicker

  def choose(restaurants)
    picks = restaurants
      .sort_by { |restaurant| restaurant.last_visit }
      .select  { |restaurant| restaurant if qualified(restaurant) }
    picks.sample
  end

  private
    def qualified(restaurant)
      (restaurant.last_visit < 1.week.ago && restaurant.rating > 2)
    end
end
