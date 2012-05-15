class Blog < ActiveResource::Base
  #self.site = "http://localhost:3000"
  self.site = "http://cms.everyday-cn.com"

  def self.get_blogs_by_category(id,dt)
    Blog.find(:all, :from =>"/blogs/#{id}/#{dt}.xml")
  end
end
