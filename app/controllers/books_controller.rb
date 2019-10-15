class BooksController < ApplicationController
  before_action :logged_in_user, only: [:index, :show]
  def index
    @books = if params[:term]
      Book.where('title LIKE ?', "%#{params[:term]}%").paginate(page: params[:page])
    else
      Book.all.paginate(page: params[:page])
    end
  end

  def show
    @book = Book.find(params[:id])
    @reviews = @book.reviews
  end
  private
  def logged_in_user
    if current_user.nil?
      redirect_to login_path
    end
  end
end

