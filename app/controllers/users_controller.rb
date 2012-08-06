class UsersController < ApplicationController
  helper_method :sort_column, :sort_direction
  before_filter :require_user, :except => [:new, :create]
  before_filter :require_admin, :only => [:index]
  
  def index
    @users = User.search(params[:search]).order(sort_column + " " + sort_direction).paginate(:per_page => 10, :page => params[:page])
  end
  
  def show
    @user = User.find(params[:id])
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
	  UserMailer.registration_confirmation(@user).deliver
      flash[:notice] = t("general.successfully_created")
      #redirect_to @user
	  redirect_to :controller => "user_sessions", :action => "new"
    else
      render :action => 'new'
    end
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      flash[:notice] = t("general.successfully_updated")
	  if current_user.is_admin == 1
      	redirect_to users_path
	  elsif current_user.is_admin == 2
      	redirect_to merchants_path		
	  else
		redirect_to fronts_path
	  end		
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:notice] = t("general.successfully_destroyed")
    redirect_to users_url
  end
  
  private
  
  def sort_column
    User.column_names.include?(params[:sort]) ? params[:sort] : "id"
  end
  
  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "desc"
  end
  def home
  end
end
