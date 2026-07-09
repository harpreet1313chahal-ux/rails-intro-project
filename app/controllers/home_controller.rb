class HomeController < ApplicationController
  def index
    @book_count = Book.count
    @author_count = Author.count
    @category_count = Category.count
  end

  def about
  end

  def dataset
  end
end