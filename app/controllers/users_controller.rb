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

  def index
  end

  def show
  end

  def delete
  end

end

