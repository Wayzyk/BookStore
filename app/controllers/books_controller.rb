class BooksController < ApplicationController

  def index
    if params[:category].blank?
      @books = Book.all
    else
      @books = Book.page(params[:page]).per(12).joins(:categories).where(categories: { name: params[:category] })
    end
    @order_item = current_order.order_items.new
  end

  def show
    @book = Book.find(params[:id])
    @reviews_count = @book.reviews.count
    @book_attachment = @book.book_attachments.build
    @order_item = current_order.order_items.new(book: @book)
  end
end
