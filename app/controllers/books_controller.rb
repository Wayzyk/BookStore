class BooksController < ApplicationController

  def index
    if params[:category].blank?
      @books = Book.page(params[:page]).per(12).order(params[:sort])
    else
      @books = Book.page(params[:page]).per(12).joins(:categories).where(categories: { name: params[:category] })
    end
    @order_item = current_order.order_items.new
  end

  def show
    @book = Book.find(params[:id]).decorate
    @reviews_count = @book.reviews.count
    @book_attachment = @book.book_attachments.build
    @order_item = current_order.order_items.new(book: @book)
  end

  def last_books
    @latest_books = Book.last(3)
  end
end
