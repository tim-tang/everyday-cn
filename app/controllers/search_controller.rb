class SearchController < ApplicationController
  add_breadcrumb "Home", :root_path

  def search
    @keyword = params[:search]
    @blogs = Blog.find(:all, :from=>"/blogs/#{URI.escape(params[:search])}/search.xml")
  end

end
