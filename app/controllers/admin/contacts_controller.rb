class Admin::ContactsController < ApplicationController

  before_filter :require_user
  before_filter :admin

  def index
    @contacts = Contact.paginate(:all, :order => "created_at DESC", :page => params[:page], :per_page => 20)
  end

  def show
    @contact = Contact.find(params[:id])
  end

  def destroy
    Contact.destroy(params[:id])
    flash[:notice] = "Контакт был удалён"
    redirect_to :back
  end

end

