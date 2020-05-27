class BooksController < ApplicationController

  # ログイン済ユーザーのみにアクセスを許可する
  before_action :authenticate_user!


  def create
  	@book = Book.new(book_params)
  	@book.user_id = current_user.id
  	if @book.save
  		redirect_to @book
  	elsif
  		render :new
  	end
  end

  def index
  	@books = Book.all
  	@user = @current_user
  end

  def show
  	@book = Book.find(params[:id])
  	@user = @book.user
  end

  def edit
  	@book = Book.find(params[:id])
  end

  def update
  	@book = Book.find(params[:id])
  	if @book.update(book_params)
  		@user = @current_user
  		redirect_to @book
  	elsif
  		render :edit
  	end
  end

  def destroy
  	@book = Book.find(params[:id])
  	@book.destroy
  	redirect_to @book
  end

  private
  	def book_params
  		params.require(:book).permit(:title, :body, :user_id)
  	end
end
