class BlogController < ApplicationController
    add_breadcrumb "Home", :root_path

  def index
    @categories = Category.find(:all)
    @hot_topics = Blog.find(:all, :from=>"/hot/topics.xml")
    currentTime = (Time.now+1.day).strftime('%Y-%m-%d')
    @blogs = Blog.find(:all, :from =>"/blogs/#{currentTime}.xml")
  end

  def show
    @blog = Blog.find(:one, :from=>"/blog/#{params[:id]}.xml")
    Blog.put("/blog/#{params[:id]}/sync")
    @next_blog = Blog.find(:all, :from=>"/blog/#{params[:id]}/next.xml")[0]
    add_breadcrumb "Reading Blog", show_path
  end

  def load
    param = params[:id].split(" ")
    @blogs = Blog.find(:all, :from =>"/blogs/#{param[0]}.xml")
  end

end
