class UsersController < ApplicationController

  layout "main"

  before_filter :contents

  def new
    @debate = Debate.last
    @comment = Comment.new(:debate_id => @debate.id)
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      redirect_back_or_default root_url
    else
      @debate = Debate.last
      @comment = Comment.new(:debate_id => @debate.id)
      render :action => "new"
    end
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    @user.update_attributes(params[:user])
    if @user.save
      redirect_to root_url
    else
      render :action => "edit"
    end
  end

end

