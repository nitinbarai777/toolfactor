class FrontsController < ApplicationController
  layout "fronts"
  helper_method :sort_column, :sort_direction
  # search tool
  def index
    @o_all = Tool.get_search_tools(params[:age_id], params[:factors]).order(sort_column + " " + sort_direction).paginate(:per_page => 10, :page => params[:page])
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
