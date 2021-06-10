class BooksController < ApplicationController
  def edit
    @book = Book.find(params[:id])
  end
  
  def show
    @user_book = Book.find(params[:id])
    @user = User.find(@user_book.user_id)
  end
  
  def create
    @book = current_user.books.new(book_params)
    @book.save
    redirect_to book_path(@book.id)
  end
  
  def update
    @book = Book. find(params[:id])
    @book.update(book_params)
    redirect_to book_path(@book.id)
  end
  
  private
  
  def book_params
    params.require(:book).permit(:title, :body)
  end

end
