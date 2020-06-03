class UsersController < ApplicationController

  # ログイン済ユーザーのみにアクセスを許可する
  before_action :authenticate_user!
  before_action :screen_user, only: [:edit, :update]

  def index
    @user = current_user
    @users = User.all
    @book = Book.new
  end

  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to @user, notice: "You have updated user successfully."
    elsif
      render :edit
    end
  end

  private
    def user_params
      params.require(:user).permit(:name, :introduction, :user_image)
    end

    def screen_user
      if params[:id].to_i != current_user.id
          redirect_to user_path(current_user)
      end
    end


end
