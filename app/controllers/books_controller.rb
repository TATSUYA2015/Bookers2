class BooksController < ApplicationController

  def new
    @book=Book.new
  end

  def index
    @book=Book.new
    @books=Book.all
    @user=current_user
  end

    def create
    book=Book.new(book_params)
    book.save
    redirect_to '/books'
  end

  def show
    @book=Book.find(params[:id])
  end

  private

  def book_params
    params.require(:book).permit(:title, :body )
  end
end
