class Admin::ContentsController < ApplicationController

  def index
    @contents = Content.find(:all)
  end

  def edit
    @content = Content.find(params[:id])
  end

  def update
    @content = Content.find(params[:id])
    @content.update_attributes(params[:content])
    if @content.save
      flash[:notice] = "Content was saved."
      redirect_to admin_contents_url
    else
      render :action => "edit"
    end
  end

  def show
    @content = Content.find(params[:id])
  end

  def destroy
    Content.destroy(params[:id])
    flash[:notice] = "Content was destroed."
    redirect_to :back
  end

  def new
    @content = Content.new
  end

  def create
    @content = Content.new(params[:content])
    if @content.save
      flash[:notice] = "Content was saved."
      redirect_to admin_contents_url
    else
      render :action => "new"
    end
  end
end

