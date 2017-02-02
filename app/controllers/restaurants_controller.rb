class RestaurantsController < ApplicationController
  def index
    @user = current_user
    @restaurants = Restaurant.all.sort_by{ |restaurant| restaurant.last_visit }
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end

  def create
    @user = current_user
    @restaurant = Restaurant.new(params.require(:restaurant).permit(:title, :rating, :last_visit))
    @restaurant.user_id = @user.id

    if @restaurant.save
      flash[:notice] = "Restaurant #{@restaurant.title} Now in List"
      redirect_to :back
    end
  end

  def destroy
    @user = current_user
    @restaurant = Restaurant.find(params[:id])
    @restaurant.destroy
    redirect_to restaurants_index_path
  end


  def edit
    @restaurant = Restaurant.find(params[:id])
  end

  def update
    @restaurant = Restaurant.find(params[:id])
    @restaurant.assign_attributes(restaurant_params)
    if @restaurant.save
      flash[:notice] = "Restaurant was updated."
      redirect_to restaurants_index_path
    else
      flash.now[:alert] = "There was an error updating the restaurant. Please try again."
      redirect_to :back
    end
  end

  def restaurant_params
    params.require(:restaurant).permit(:title, :rating, :last_visit)
  end
end
