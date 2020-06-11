class CommentsController < ApplicationController
  before_action :set_comment, only: [:destroy]

  def create
    @book = Book.find(params[:book_id])
    @comment = @book.comments.build(comment_paramas)
    @comment.user_id = current_user.id
    @comment.save
    render :index
  end

  def edit

  end

  def update

  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    render :index
  end

  private
    def set_comment
      @comment = Comment.find_by(id: params[:id])
    end

    def comment_paramas
      params.require(:comment).permit(:body, :book_id, :user_id)
    end

end
