class BooksController < ApplicationController
def index
  books = Book.includes(:author, :publisher, :category)

  if params[:search].present?
    books = books.where("title LIKE ?", "%#{params[:search]}%")
  end

  if params[:category_id].present?
    books = books.where(category_id: params[:category_id])
  end

  @categories = Category.order(:name)

  @pagy, @books = pagy(books, limit: 20)
end

  def show
    @book = Book.find(params[:id])
  end
end