class CategoryController < ApplicationController

  def index
    @catname = params[:catname]
    @categoryId = params[:id]
    currentTime = Time.now.strftime('%Y-%m-%d')
    @blogs=Blog.get_blogs_by_category(params[:id],currentTime)
  end

  def load
    dt = params[:id].split(" ")[0]
    id = params[:id].split(" ")[1].split("&")[1]
    @blogs = Blog.get_blogs_by_category(id,dt)
  end

end
