class BooksController < ApplicationController
def index
  books = Book.includes(:author, :publisher, :category)

  if params[:search].present?
    books = books.where("title LIKE ?", "%#{params[:search]}%")
  end

  if params[:category_id].present?
    books = books.where(category_id: params[:category_id])
  end

  if params[:sort].present?
    case params[:sort]
    when "title_asc"
      books = books.order(title: :asc)
    when "title_desc"
      books = books.order(title: :desc)
    when "rating_desc"
      books = books.order(rating: :desc)
    when "rating_asc"
      books = books.order(rating: :asc)
    end
  end

  @categories = Category.order(:name)

  @pagy, @books = pagy(books, limit: 20)
end

  def show
    @book = Book.find(params[:id])
  end
end