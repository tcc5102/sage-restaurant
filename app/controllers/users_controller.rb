class UsersController < ApplicationController
  def show
    @user = User.find(params[:id] || current_user.id)
    @restaurants = @user.restaurants
    @picked_restaurant = RestaurantPicker.new.choose(@restaurants)
  end
end
