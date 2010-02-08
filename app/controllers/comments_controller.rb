class CommentsController < ApplicationController

  layout "main"

  before_filter :contents

  def new
    @debate = Debate.find(params[:debate_id])
    @comment = Comment.new(:debate_id => params[:debate_id])
  end

  def create
    @comment = Comment.new(params[:comment])
    if @comment.save
      redirect_to debate_url(@comment.debate_id)
    else
      if params[:comment][:debate_id]
        @debate = Debate.find(params[:comment][:debate_id])
      else
        @debate = Debate.find(params[:debate_id])
      end
      render :action => "new"
    end
  end

end

