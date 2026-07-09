class AuthorsController < ApplicationController
def index
  @authors = Author.left_joins(:books)
                   .select("authors.*, COUNT(books.id) AS books_count")
                   .group("authors.id")
                   .order(:name)
end

  def show
    @author = Author.find(params[:id])
   @books = @author.books
                .includes(:publisher, :category)
                .order(:title)
  end
end