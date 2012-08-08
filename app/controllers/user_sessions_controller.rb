class UserSessionsController < ApplicationController

  before_filter :require_user, :except => [:new, :create]
  # GET /user_sessions/new
  # GET /user_sessions/new.xml
  def new
    if !session[:user_id].nil?
        redirect_to :controller => "users", :action => "index"
    else
		@user_session = UserSession.new

		respond_to do |format|
		  format.html # new.html.erb
		  format.xml { render :xml => @user_session }
		end
	end
  end


  # POST /user_sessions
  # POST /user_sessions.xml
  def create
    @user_session = UserSession.new(params[:user_session])

    respond_to do |format|
      if @user_session.save
		session[:user_id] = current_user.id
	    format.html { redirect_to(:admin_home, :notice => t("general.login_successful")) }
        format.xml { render :xml => @user_session, :status => :created, :location => @user_session }
      else
        format.html { render :action => "new" }
        format.xml { render :xml => @user_session.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /user_sessions/1
  # DELETE /user_sessions/1.xml
  def destroy
    @user_session = UserSession.find
    @user_session.destroy
	session[:user_id] = nil

    respond_to do |format|
      format.html { redirect_to(:login, :notice => t('general.Goodbye')) }
      format.xml { head :ok }
    end
  end

  def home
	if !params[:locale].nil?
		redirect_to session[:requested_path]
	else
	end
  end
end
