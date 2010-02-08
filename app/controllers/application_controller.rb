# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  helper :breadcrumbs
  protect_from_forgery # See ActionController::RequestForgeryProtection for details
  helper_method :current_user_session, :current_user
  filter_parameter_logging :password, :password_confirmation

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password

  def rules
    @rules = Content.find_by_permalink("new_debate")
  end

  def comment
    @comment = Comment.new
  end

  def contents
    @contents = Content.find_all_by_permalink("*")
  end

  def current_user
    return @current_user if defined?(@current_user)
    @current_user = current_user_session && current_user_session.record
    return @current_user
  end

  def current_user_session
    return @current_user_session if defined?(@current_user_session)
    @current_user_session = UserSession.find
  end


  def require_user
    unless current_user
      store_location
      flash[:notice] = "Вы должны быть авторизорованны для доступа к этой страници."
      redirect_to new_user_session_url
      return false
    end
  end

  def require_no_user
    if current_user
      store_location
      flash[:notice] = "Вы должны быть авторизорованны для доступа к этой страници."
      redirect_to account_url
      return false
    end
  end

  def store_location
    session[:return_to] = request.request_uri
  end

  def redirect_back_or_default(default)
    redirect_to(session[:return_to] || default)
    session[:return_to] = nil
  end
end

