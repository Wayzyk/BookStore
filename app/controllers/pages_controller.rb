class PagesController < ApplicationController
  def home
    @best_sellers = Book.first(4)
  end
end
