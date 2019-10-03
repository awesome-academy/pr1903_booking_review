class ReviewsController < ApplicationController
  before_action :logged_in_user, only: [:create]

  def create
    @review = current_user.reviews.new(review_params)
    if @review.save!
      redirect_to @review.book
    else
      redirect_to root_url
    end
  end

  private
  def logged_in_user
    if current_user.nil?
      redirect_to login_path
    end

  end

  def review_params
    params.require(:review).permit(:content, :book_id)
  end
end
