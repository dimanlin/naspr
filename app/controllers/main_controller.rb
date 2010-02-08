class MainController < ApplicationController

  before_filter :contents

  def index
    @debates = Debate.find(:all, :limit => 20, :order => "created_at DESC")
    @comment = Comment.new(:debate_id => @debates.first.id)
  end

  def show
    @page = Content.find_by_path(params[:permalink])
  end

end

