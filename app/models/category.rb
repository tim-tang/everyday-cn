class Category < ActiveResource::Base
  self.site="http://localhost:3000"

  def self.get_category(categoryId)
    Category.find(:one, :from=>"/category/#{categoryId}.xml")
  end
end
