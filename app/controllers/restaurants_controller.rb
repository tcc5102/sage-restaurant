class RestaurantsController < ApplicationController
  def index
    @user = current_user
    @restaurants = Restaurant.all
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end

  def create
    @user = current_user
    @restaurant = Restaurant.new(params.require(:restaurant).permit(:title, :rating))
    @restaurant.user_id = @user.id

    if @restaurant.save
      flash[:notice] = "Restaurant #{@restaurant.title} Now in List"
      redirect_to :back
    end
  end

  def edit
    @restaurant = Restaurant.find(params[:id])
  end

  def update
    @restaurant = Restaurant.find(params[:id])
    @restaurant.assign_attributes(restaurant_params)
    p @restaurant
    if @restaurant.save
      flash[:notice] = "Restaurant was updated."
      redirect_to :back
    else
      flash.now[:alert] = "There was an error updating the restaurant. Please try again."
      redirect_to :back
    end
  end

  def restaurant_params
    params.require(:restaurant).permit(:title, :rating)
  end
end
