class ToolReport < ActiveRecord::Base
  attr_accessible :age, :browser_agent, :factors
  def self.search(search)
    if search
     	where('browser_agent LIKE ? OR age LIKE ? OR factors LIKE ?', "%#{search}%", "%#{search}%", "%#{search}%")
    else
		scoped
    end
  end
end
