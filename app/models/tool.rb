class Tool < ActiveRecord::Base
  mount_uploader :image, ImageUploader
  attr_accessible :description, :image, :name

  def self.search(search)
    if search
     	where('name LIKE ?', "%#{search}%")
    else
		scoped
    end
  end

  def self.get_search_tools(age_id, factors)
		if age_id != "" && factors != ""

		  joins(:tool_age, :tool_factor).where("merchants.id" => merchant_id, "merchant_locations.city_id" => city_id, "merchant_locations.area_id" => area_id).select("merchants.id, merchants.name, merchants.email, merchants.url, merchant_locations.city_id, merchant_locations.area_id, merchant_locations.contact, cities.name as cityname, areas.name as areaname, coupons.name as couponname, coupons.price, coupons.valid_to")

		end


  end

end
