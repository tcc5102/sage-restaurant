class UsersController < ApplicationController
  def show
    @user = User.find(params[:id] || current_user.id)
    @restaurants = @user.restaurants
  end
end
