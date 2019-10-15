class LikesController < ApplicationController
  before_action :logged_in_user, only: [:new]
    before_action :current_user, only: [:create, :destroy]

  def new
    @like = Like.new(like_params)
  end

  def create
    @like = current_user.likes.new(like_params)
    respond_to do |format|
      if @like.save
        format.html{redirect_to(@like.book)}
        format.js
      end
    end
  end


  def destroy
    @like = Like.find(params[:id])
    book = @like.book
    respond_to do |format|
      if @like.destroy
        format.html{redirect_to(@like.book)}
      end
    end
  end

  private
  def like_params
    params.require(:likes).permit(:book_id)
  end

  def logged_in_user
    if current_user.nil?
      redirect_to login_path
    end
  end

  def current_user?
    unless @user == current_user
      redirect_to 'login_path'
    end
  end
end
