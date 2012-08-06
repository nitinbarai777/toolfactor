class ToolAge < ActiveRecord::Base
  belongs_to :tool
  belongs_to :age
  # attr_accessible :title, :body
  validates :age, :presence => true
end
