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

	if (params[:tool] || (params[:age_id] && params[:age_id] != ''))
		toolReportNew(params[:age_id], @factors_id_arr)
		@o_all = Tool.get_search_tools(params[:age_id], @factors_id_arr, params[:tool]).first
	end

  end

  private
  
  def toolReportNew(age_id, factor_arr)
		@o_single = ToolReport.new
		@o_single.browser_agent = request.user_agent
		if age_id != ''
			@o_single.age = Age.find(age_id.to_i).name
		else
			@o_single.age = " "
		end
		@o_single.factors = factor_arr.join(",")
		@o_single.save		
  end
  # sort column private method
  def sort_column
    Tool.column_names.include?(params[:sort]) ? params[:sort] : "id"
  end
  
  # order records private method
  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "desc"
  end
end
