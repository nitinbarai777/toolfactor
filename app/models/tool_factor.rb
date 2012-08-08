class ToolFactor < ActiveRecord::Base
  belongs_to :tool
  belongs_to :factor
  # attr_accessible :title, :body
  validates :factor_id, :presence => true

  def self.search(id)
    if !id.nil?
   	  where(:tool_id => id)
	else
      scoped
    end
  end

end
