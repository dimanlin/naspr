class Admin::UsersController < ApplicationController

  def index
    @users = User.paginate :page => params[:page], :per_page => 40, :order => "created_at DESC"
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update_attributes(params[:user])
    if @user.save
      flash[:notice] = "User whith ID #{@user.id} was updated."
      redirect_to admin_users_url
    else
      if @user.master == true
        render :action => "edit_admin"
      else
        render :action => "edit"
      end
    end
  end

  def destroy
    User.destroy(params[:id])
    flash[:flash] = "User was destroed."
    redirect_to :back
  end

  def edit_admin
    @user = User.find(:all, :limit => 1, :conditions => ["master = ?", true])
  end
end

