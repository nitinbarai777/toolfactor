class ToolAge < ActiveRecord::Base
  belongs_to :tool
  belongs_to :age
  # attr_accessible :title, :body
  validates :age_id, :presence => true

  def self.search(id)
    if !id.nil?
   	  where(:tool_id => id)
	else
      scoped
    end
  end

end
