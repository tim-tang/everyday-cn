class Category < ActiveResource::Base
  self.site="http://localhost:3000"
  #self.site="http://cms.everyday-cn.com"

  def self.get_category(categoryId)
    Category.find(:one, :from=>"/category/#{categoryId}.xml")
  end
end
