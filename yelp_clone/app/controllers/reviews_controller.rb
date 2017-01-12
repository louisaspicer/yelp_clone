class ReviewsController < ApplicationController

  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
  end

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    params = review_params.to_h
    params[:user_id] = current_user.id
    @restaurant.reviews.create!(params)


    redirect_to "/restaurants/#{@restaurant.id}"
  end

  private
  def review_params
    params.require(:review).permit(:thoughts, :rating)
  end

end
