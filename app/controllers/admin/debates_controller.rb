class Admin::DebatesController < ApplicationController

  before_filter :require_user
  before_filter :admin

  def check
    @debate = Debate.find(params[:id])
    @debate.update_attributes(:check => true)
    @debate.save
    flash[:notice] = "Мнение с ID #{@debate.id} проверенно."
    redirect_to :back
  end

  def index
    @debates = Debate.paginate :page => params[:page], :per_page => 20, :order => "created_at DESC"
  end

  def edit
    @debate = Debate.find(params[:id])
  end

  def show
    @debate = Debate.find(params[:id])
  end

  def destroy
    Debate.destroy(params[:id])
    redirect_to admin_debates_url
  end

  def update
    @debate = Debate.find(params[:id])
    @debate.update_attributes(params[:debate])
    if @debate.save
      flash[:notice] = "Debate whis ID #{@debate.id} whil be saved!"
      redirect_to admin_debates_url
    else
      render :action => "edit"
    end
  end

end

