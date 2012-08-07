class FrontsController < ApplicationController
  layout "fronts"
  helper_method :sort_column, :sort_direction
  # search tool
  def index
	@factors_id_arr = Array.new
   	#@factors_id_arr = params[:tool][:factors].collect { |factor_id| factor_id.to_i }
	if params[:tool]
		params[:tool][:factors].each do |i, j|
			#@factors_id_arr.push[j]
			@factors_id_arr << j.to_i
		end
    end

	if params[:tool] || params[:age_id] != ''
		@o_all = Tool.get_search_tools(params[:age_id], @factors_id_arr).first
	end

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
