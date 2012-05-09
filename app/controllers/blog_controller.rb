class BlogController < ApplicationController

  def index
    currentTime = Time.now.strftime('%Y-%m-%d')
    @blogs = Blog.find(:all, :from =>"/blogs/#{currentTime}.xml")
    #@blog = Blog.find(:one, :from=>'/blog/56.xml')
  end

  def load
    date = params[:id].split(" ")[0]
    @blogs = Blog.find(:all, :from =>"/blogs/#{date}.xml")
  end

  def show
    @blog = Blog.find(:one, :from=>"/blog/#{params[:id]}.xml")
  end

end
