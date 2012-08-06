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


  def create1
	if params[:user][:email].blank?
		flash[:error_login] = 'Email Required.'
		redirect_to :action => "new"
	elsif params[:user][:password].blank?
		flash[:error_login] = 'Password Requied.'
		redirect_to :action => "new"
	elsif user = User.authenticate(params[:user][:email],params[:user][:password])
		session[:user_id] = user.id
		flash[:error_login] = 'Login successfully.'
		redirect_to :controller => "pages", :action => "index"
    else
  		flash[:error_login] = 'Credentials you entered are not valid.Please check the spelling for both email address and password.'
	    redirect_to :action => "new"
    end
  end


  # POST /user_sessions
  # POST /user_sessions.xml
  def create
    @user_session = UserSession.new(params[:user_session])

    respond_to do |format|
      if @user_session.save
		session[:user_id] = current_user.id
	    format.html { redirect_to(:admin_home, :notice => t("common.login_successful")) }
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
      format.html { redirect_to(:users, :notice => 'Goodbye!') }
      format.xml { head :ok }
    end
  end

  def home
  end
end
