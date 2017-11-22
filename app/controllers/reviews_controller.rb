class ReviewsController < ApplicationController


  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
  end

  def create
    @review = Review.new(params_review)
    @review.restaurant = Restaurant.find(params[:restaurant_id])
    if @review.save
      redirect_to @review.restaurant
    else
      render :new
    end
  end

  private

  def params_review
    params.require(:review).permit(:rating, :content)
  end
end
