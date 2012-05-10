class Blog < ActiveResource::Base
  self.site = "http://localhost:3000"

  def self.get_blogs_by_category(id,dt)
    Blog.find(:all, :from =>"/blogs/#{id}/#{dt}.xml")
  end
end
