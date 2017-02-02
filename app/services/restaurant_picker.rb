class RestaurantPicker
  def choose_oldest(restaurants)
    last = restaurants.first
    restaurants.each do |restaurant|
      if restaurant.last_visit < last.last_visit
        last = restaurant
      end
    end
    last
  end

  def choose_newest(restaurants)
    first = restaurants.last
    restaurants.each do |restaurant|
      if restaurant.last_visit > first.last_visit
        first = restaurant
      end
    end
    first
  end

  def choose_oldest_and_best(restaurants)
    picks = restaurants
      .sort_by { |restaurant| restaurant.last_visit }
      .select  { |restaurant| restaurant if qualified(restaurant) }
    picks.first
  end

  private
    def qualified(restaurant)
      (restaurant.rating > 2)
    end
end

#ignore most recent, unless only 1
#ignore second most recent
#choose highest rated
#pick highest rated, exclude ratings of 1
