class ToolsController < ApplicationController
  helper_method :sort_column, :sort_direction

  # fetch all records
  def index
    @o_all = Tool.search(params[:search]).order(sort_column + " " + sort_direction).paginate(:per_page => 10, :page => params[:page])
  end
  
  #fetch single record and display
  def show
    @o_single = Tool.find(params[:id])
	@o_tool_ages = ToolAge.find(:all, :conditions => ["tool_id = ?", @o_single.id.to_i])
	@o_tool_factors = ToolFactor.find(:all, :conditions => ["tool_id = ?", @o_single.id.to_i])

  end
  
  # generate a form for new record
  def new
    @o_single = Tool.new
  end
  
  #create a new record and save in database
  def create
    @o_single = Tool.new(params[:tool])
    if @o_single.save
      flash[:notice] = t("general.successfully_created")
      redirect_to tools_path
    else
      render :action => 'new'
    end
  end
  
  # generate a edit form to update the record
  def edit
    @o_single = Tool.find(params[:id])
  end
  
  # update a record and save in database
  def update
    @o_single = Tool.find(params[:id])
    if @o_single.update_attributes(params[:tool])
      flash[:notice] = t("general.successfully_updated")
      redirect_to tools_path
    else
      render :action => 'edit'
    end
  end
  
  #destoy a record
  def destroy
    @o_single = Tool.find(params[:id])
    @o_single.destroy
    flash[:notice] = t("general.successfully_destroyed")
    redirect_to tools_url
  end
  
  private
  
  # sort column private method
  def sort_column
    Tool.column_names.include?(params[:sort]) ? params[:sort] : "id"
  end
  
  # order records private method
  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "desc"
  end
end
