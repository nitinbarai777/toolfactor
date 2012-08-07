class ToolReportsController < ApplicationController
  helper_method :sort_column, :sort_direction

  # fetch all records
  def index
    @o_all = ToolReport.search(params[:search]).order(sort_column + " " + sort_direction).paginate(:per_page => 10, :page => params[:page])

  end

  def export_csv
	respond_to do |format|
		format.csv { render :layout => false }
	end
  end

  #destoy a record
  def destroy
    @o_single = ToolReport.find(params[:id])
    @o_single.destroy
    flash[:notice] = t("general.successfully_destroyed")
    redirect_to tool_reports_url
  end
  
  private
  
  # sort column private method
  def sort_column
    ToolReport.column_names.include?(params[:sort]) ? params[:sort] : "id"
  end
  
  # order records private method
  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "desc"
  end
end
