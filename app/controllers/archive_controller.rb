class ArchiveController < ApplicationController

  def index
    currentTime = Time.now.strftime('%Y-%m-%d')
    @blogs = Blog.find(:all, :from =>"/blogs/#{currentTime}.xml")
  end

  def load
    param = params[:id].split(" ")
    @blogs = Blog.find(:all, :from =>"/blogs/#{param[0]}.xml")
  end

end
