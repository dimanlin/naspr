class ContactsController < ApplicationController

  layout "main"

  before_filter :contents

  def index
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(params[:contact])
    if @contact.save
      flash[:notice] = "Сообщение было успешно отправленно"
      redirect_to :back
    else
      render :action => "index"
    end
  end

end

