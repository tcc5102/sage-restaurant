class RestaurantsController < ApplicationController
  def index
    @user = current_user
    @restaurants = Restaurant.all
  end

  def create
    @user = User.find(params[:user_id])
    @restaurant = current_user.restaurants.create(restaurant_params)

    if @restaurant.save
      flash[:notice] = "Restaurant #{@restaurant.title} Now in List"
      redirect_to :back
    end
  end

  def restaurant_params
    params.require(:restaurant).permit(:title, :rating)
  end
end
