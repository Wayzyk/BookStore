class BooksController < ApplicationController

  def index
    if params[:category].blank?
      @books = Book.page(params[:page])
    else
      @category_id = Category.find_by(name: params[:category]).id
      @books = Book.where(category_id: @category_id)
    end
  end

  def show
    @book = Book.find(params[:id])
    @reviews_count = @book.reviews.count
  end
end
