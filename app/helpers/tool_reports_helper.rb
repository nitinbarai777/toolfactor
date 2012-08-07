module ToolReportsHelper
	require 'csv'
	def this_is_your_view_helper_method
		@header_row = Array["Browser Agent", "Age", "Date/Time"]
		Factor.find(:all).each do |f|
			@header_row.push(f.name)
		end

	  CSV.generate do |csv| 
		csv << @header_row
		ToolReport.find(:all).each do |r|
			@row_data = Array[r.browser_agent.gsub(';', ' '), r.age, r.created_at]
			@factors_arr = r.factors.split(",")
			Factor.find(:all).each do |f|
				if @factors_arr.include?(f.id.to_s)
					@row_data.push("Y")
				else
					@row_data.push("N")
				end
			end
			csv << @row_data
		end
	  end

	end
end
