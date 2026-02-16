class CommentsController < ApplicationController
  before_action :set_blog

  def create
    @comment = @blog.comments.build(comment_params)

    if @comment.save
      redirect_to @blog, notice: "Comment was successfully created."
    else
      redirect_to @blog, alert: "Error creating comment: #{@comment.errors.full_messages.join(', ')}"
    end
  end

  def destroy
    @comment = @blog.comments.find(params[:id])
    @comment.destroy
    redirect_to @blog, notice: "Comment was successfully destroyed."
  end

  def edit
    @comment = @blog.comments.find(params[:id])
  end

  def update
    @comment.update(comment_update_params)
    redirect_to @blog, notice: "Comment was successfully updated."
  end

  private

  def set_blog
    @blog = Blog.find(params[:blog_id])
  end

  def comment_update_params
    params.expect(comment: [ :content ])
  end

  def comment_params
    params.expect(comment: [ :content ])
  end
end
