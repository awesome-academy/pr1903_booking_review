class ReviewsController < ApplicationController
  before_action :logged_in_user, only: [:create, :update]
  before_action :find_review, only: [:show, :edit, :update]

  def create
    @review = current_user.reviews.new(review_params)
    if @review.save!
      redirect_to @review.book
    else
      redirect_to root_url
    end
  end

  def update
    if @review.update_attributes(review_params)
      flash[:success] = "updated"
      redirect_to @review
    else
      render 'edit'
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

  def find_review
    @review = Review.find(params[:id])
  end
end
