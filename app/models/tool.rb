class Tool < ActiveRecord::Base
  mount_uploader :image, ImageUploader
  attr_accessible :description, :image, :name
  has_many :tool_ages
  has_many :tool_factors
  validates :name, :presence => true

  def self.search(search)
    if search
     	where('name LIKE ?', "%#{search}%")
    else
		scoped
    end
  end

  def self.get_search_tools(age_id, factors, too_ids)
	if age_id && age_id != "" && too_ids
	  joins(:tool_ages, :tool_factors).where("tool_ages.age_id" => age_id, "tool_factors.factor_id" => factors).select("tools.name, tools.description, tools.image")
	elsif age_id && age_id != "" && !too_ids
	  joins(:tool_ages, :tool_factors).where("tool_ages.age_id" => age_id).select("tools.name, tools.description, tools.image")
	elsif !age_id && age_id == "" && too_ids
	  joins(:tool_ages, :tool_factors).where("tool_factors.factor_id" => factors).select("tools.name, tools.description, tools.image")
	else
	  scoped
	end
  end

end
