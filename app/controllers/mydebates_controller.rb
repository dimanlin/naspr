class MydebatesController < ApplicationController

  before_filter :require_user

  layout "main"

  def index
    @debates = Debate.paginate(:all, :conditions => ["user_id = ?", current_user.id], :per_page => 20, :page => params[:page], :order => "created_at DESC")
  end

end

