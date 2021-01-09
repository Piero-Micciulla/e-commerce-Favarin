class ReviewsController < ApplicationController
  def new
    # we need @shop in our `simple_form_for`
    @shop = Shop.find(params[:shop_id])
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    # we need `shop_id` to associate review with corresponding shop
    @shop = Shop.find(params[:shop_id])
    @review.shop = @shop
    if @review.save
      redirect_to shop_path(@shop)
    else
      render :new
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to shop_path(@review.shop)
  end

  private

  def review_params
    params.require(:review).permit(:content)
  end
end
