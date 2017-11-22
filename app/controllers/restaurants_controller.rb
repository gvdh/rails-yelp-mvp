class RestaurantsController < ApplicationController

  before_action :set_restaurant, only: [:show]
  def top
     @reviews = Review.order(rating: :desc).limit(5)
  end

  def index
    @restaurants = Restaurant.all
    the_average = []
    @restaurants.each { |restaurant| restaurant.reviews.each { |review| the_average << review.rating }}
    @average = the_average.inject{ |sum, el| sum + el }.to_f / the_average.size
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(params_restaurant)
    if @restaurant.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new
    end
  end

  def show
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

  def params_restaurant
    params.require(:restaurant).permit(:address, :name, :category)
  end
end
