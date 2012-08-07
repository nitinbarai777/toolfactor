class Factor < ActiveRecord::Base
  attr_accessible :name
  validates :name, :presence => true
  def self.search(search)
    if search
     	where('name LIKE ?', "%#{search}%")
    else
		scoped
    end
  end
end
