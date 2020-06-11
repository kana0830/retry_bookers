class BooksController < ApplicationController

  # ログイン済ユーザーのみにアクセスを許可する
  before_action :authenticate_user!

  def create
		@book = Book.new(book_params)
		@book.user_id = current_user.id
		if @book.save
			redirect_to @book, notice: "You have creatad book successfully."
		else
			@user = current_user
      @books = Book.all
			render :index
		end
  end

  def index
		@books = Book.all
		@user = @current_user
		@book = Book.new
  end

  def show
		@book = Book.find(params[:id])
		@user = @book.user
		@book_new = Book.new
		@comment = Comment.new
		@comments = @book.comments.order(created_at: :desc)
  end

  def edit
		@book = Book.find(params[:id])
		screen_user(@book)
  end

  def update
		@book = Book.find(params[:id])
		if @book.update(book_params)
			@user = @current_user
			redirect_to @book, notice: "You have updated book successfully."
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

		def screen_user(book)
      if book.user.id != current_user.id
				redirect_to books_path
			end					
    end
		
end
