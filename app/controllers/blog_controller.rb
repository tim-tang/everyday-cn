class BlogController < ApplicationController

  def index
    @categories = Category.find(:all)
    @hot_topics = Blog.find(:all, :from=>"/hot/topics.xml")
    currentTime = Time.now.strftime('%Y-%m-%d')
    @blogs = Blog.find(:all, :from =>"/blogs/#{currentTime}.xml")
  end

  def show
    @blog = Blog.find(:one, :from=>"/blog/#{params[:id]}.xml")
  end

  def load
    param = params[:id].split(" ")
    @blogs = Blog.find(:all, :from =>"/blogs/#{param[0]}.xml")
  end
end
