class ToolFactor < ActiveRecord::Base
  belongs_to :tool
  belongs_to :factor
  # attr_accessible :title, :body
end
