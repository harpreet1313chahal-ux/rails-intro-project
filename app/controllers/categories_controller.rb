class CategoriesController < ApplicationController
  def index
    @categories = Category.left_joins(:books)
                          .select("categories.*, COUNT(books.id) AS books_count")
                          .group("categories.id")
                          .order(:name)
  end

  def show
    @category = Category.find(params[:id])
    @books = @category.books.includes(:author, :publisher)
  end
end