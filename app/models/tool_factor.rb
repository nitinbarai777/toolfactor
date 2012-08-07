class ToolFactor < ActiveRecord::Base
  belongs_to :tool
  belongs_to :factor
  # attr_accessible :title, :body
  validates :factor_id, :presence => true
end
