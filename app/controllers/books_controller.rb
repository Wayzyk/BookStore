class BooksController < ApplicationController

  def index
    if params[:category].blank?
      @books = Book.page(params[:page]).per(12)
      # Kaminari.paginate_array(@books).page(params[:page]).per(12)
    else
      @books = Book.joins(:categories).where(categories: { name: params[:category] })
    end
    @order_item = current_order.order_items.new
    render action: :index, layout: request.xhr? == nil
  end

  def show
    @book = Book.find(params[:id])
    @reviews_count = @book.reviews.count
    @book_attachment = @book.book_attachments.build
    @order_item = current_order.order_items.new(book: @book)
  end
end
