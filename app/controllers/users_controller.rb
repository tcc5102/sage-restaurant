class UsersController < ApplicationController
  def show
    @user = User.find(params[:id] || current_user.id)
    @restaurants = @user.restaurants
    @picked_restaurant = RestaurantPicker.new.choose_oldest_and_best(@restaurants)
  end
end
