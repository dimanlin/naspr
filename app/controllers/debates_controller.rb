
class DebatesController < ApplicationController

  layout "main"

  before_filter :contents
  before_filter :comment, :only => [:index]
  before_filter :rules, :only => [:create, :new]

  def search
    @search_result = Debate.search params[:text], :page => params[:page]
  end

  def mydebates
    @debates = Debate.paginate(:all, :conditions => ["user_id = ?", current_user.id], :per_page => 20, :page => params[:page], :order => "created_at DESC")
  end


  def create
    @debate = Debate.create(params[:debate])

    if current_user
      @debate.update_attributes(:user_id => current_user.id)
    end

    if @debate.save
      redirect_to root_url
    else
      render :action => "new"
    end
  end

  def new
    @debate = Debate.new
  end

  def index
    if params[:page].nil?
      @debates = Debate.paginate :page => 1, :per_page => 10
    else
      @debates = Debate.paginate :page => params[:page], :per_page => 10
    end
  end

  def show
    @debate = Debate.find(params[:id])

    @numtrueansver = @debate.comments.voted_like(1).size
    @numfalseansver = @debate.comments.voted_like(0).size

    @trueansver = WillPaginate::Collection.create(params[:page] ||= 1, 10) do |pager|
      result = Comment.find(:all, :limit => pager.per_page, :offset => pager.offset, :conditions => ["voted = ? AND debate_id = ?", false, @debate.id], :order => "created_at DESC")
      pager.replace(result)

      unless pager.total_entries
        pager.total_entries = Comment.find(:all, :conditions => ["voted = ? AND debate_id = ?", false, @debate.id]).size
      end
    end

    @falseansver = WillPaginate::Collection.create(params[:page] ||= 1, 10) do |pager|
      result = Comment.find(:all, :limit => pager.per_page, :offset => pager.offset, :conditions => ["voted = ? AND debate_id = ?", true, @debate.id], :order => "created_at DESC")
      pager.replace(result)

      unless pager.total_entries
        pager.total_entries = Comment.find(:all, :conditions => ["voted = ? AND debate_id = ?", true, @debate.id]).size
      end
    end

    @comment = Comment.new(:debate_id => params[:id])

  end
end

