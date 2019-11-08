class ReviewsController < ApplicationController
  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @cocktail = Cocktail.find(params[:cocktail_id])
    @review.cocktail = @cocktail
    @review.save
    if @review.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
