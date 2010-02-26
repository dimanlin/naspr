class Admin::CommentsController < ApplicationController

  before_filter :require_user
  before_filter :admin

  def index
    @comments = Comment.paginate :page => params[:page], :per_page => 40, :order => "created_at DESC"
  end

  def destroy
    @comment = Comment.destroy(params[:id])
    flash[:notice] = "Comment whith ID #{@comment.id}, was deleted."
    redirect_to :back
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    @comment.update_attributes(params[:comment])
    if @comment.save
      flash[:notice] = "Comment whith ID #{@comment.id}, was updated."
      redirect_to admin_comments_url
    else
      render :action => "edit"
    end
  end

  def show
    @comment = Comment.find(params[:id])
  end

end

