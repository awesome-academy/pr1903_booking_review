class BooksController < ApplicationController

  def index
    @books = if params[:term]
      Book.where('title LIKE ?', "%#{params[:term]}%").paginate(page: params[:page])
    else
      Book.all.paginate(page: params[:page])
    end
  end

  def show
    @book = Book.find(params[:id])
  end

end

