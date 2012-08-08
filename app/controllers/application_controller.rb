class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user
  before_filter :set_locale
  after_filter :store_requested_path


  private
  
  def store_requested_path
	session[:requested_path] = request.path
  end

  def current_user_session
    return @current_user_session if defined?(@current_user_session)
    @current_user_session = UserSession.find
  end
  
  def current_user
    return @current_user if defined?(@current_user)
    @current_user = current_user_session && current_user_session.record
  end

  def require_user
    if session[:user_id].nil?
        redirect_to :controller => "user_sessions", :action => "new"
    end
  end

  def authenticate_password(email)
      user_exists = User.exists?(email: email)
      if user_exists
		user = User.find_by_email(email)
		return user
	  end
	  return false	
  end

  def authenticate_change_password(password)
      user_exists = User.exists?(password: password)
      if user_exists
		user = User.find_by_password(password)
		return user
	  end
	  return false	
  end

  def set_locale
    # if this is nil then I18n.default_locale will be used
    if !params[:locale].nil?
  	  I18n.locale = params[:locale] 
  	  session[:locale]=params[:locale]
    elsif !session[:locale].nil?
  	  I18n.locale = session[:locale]
    else
      session[:locale]=I18n.default_locale
    end
  end

end
