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
    @book=Book.new(book_params)
    @books=Book.all
    @book.user_id = current_user.id
    if @book.save
     flash[:notice]="You have created book successfully."
     redirect_to book_path(@book.id)
    else
     @user=current_user
     render :index
    end
  end

  def show
    @book_new=Book.new
    @books=Book.all
    @book=Book.find(params[:id])
    @user=@book.user
  end

  def edit
    @book=Book.find(params[:id])
    unless @book.user.id == current_user.id
      redirect_to books_path
    end
  end

  def update
    @book=Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "You have updated book successfully."
      redirect_to book_path(@book.id)
    else
      render :edit
    end
  end

  def destroy
    book=Book.find(params[:id])
    book.destroy
    redirect_to '/books'
  end

  private

  def book_params
   params.require(:book).permit(:title, :body, :user_id, :profile_image )
  end
end
