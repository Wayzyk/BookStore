class BooksController < ApplicationController

  def index
    @books = Book.page(params[:page])
    @filter = Category.find_by(name: Category.name)
  end

  def show
    @book = Book.find(params[:id])
    @reviews_count = @book.reviews.count
  end
end
