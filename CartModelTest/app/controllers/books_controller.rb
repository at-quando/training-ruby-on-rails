class BooksController < ApplicationController
	def new
		@book= Book.new
	end
	def create
  	@book = Book.create(book_params)
	end
	def index
  @books = Book.search(params[:search])

#scope filtering
  if params[:search_books_by_author]
    @books = Book.find_by_sql("SELECT books.* FROM orders join books on books.id==orders.book_id")
  end
end

	private
	def book_params
  	params.require(:book).permit(:author, :name, :title, :isn)
	end
end
