class BooksController < ApplicationController
  def edit
    @book = Book.find(params[:id])
  end

  def show
    @book = Book.find(params[:id])
    @user = current_user
    @e_book = Book.new
  end

  def create
    @book = current_user.books.new(book_params)
    @e_book = @book
    if @book.save
      flash[:notice] = 'You have created book successfully.'
      redirect_to book_path(@book.id)
    else
      if request.referer.include? user_path(current_user.id)
        @user = User.find(current_user.id)
        render template: "users/show"
      elsif request.referer.include? books_path
        @books = Book.all
        @user = current_user
        render :index
      elsif request.referer.include? users_path
        @users = User.all
        @user = current_user
        render template: 'users/index'
      else
        @book = Book.find(params[:id])
        @user = current_user
        render :show
      end
    end

  end

  def update
    @book = Book. find(params[:id])
    @book.update(book_params)
    flash[:notice] = "You have updated book successfully."
    redirect_to book_path(@book.id)
  end

  def index
    @books = Book.all
    @user = current_user
    @e_book = Book.new
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end

end
