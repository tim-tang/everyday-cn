class GalleryController < ApplicationController
  add_breadcrumb "Photo Gallery", :gallery_path

  def index
    currentTime = (Time.now+1.day).strftime('%Y-%m-%d')
    @galleries = Gallery.find(:all, :from=>"/avatars/#{currentTime}.xml")
  end

  def load
    param = params[:id].split(" ")
    @galleries= Gallery.find(:all, :from =>"/avatars/#{param[0]}.xml")
  end

end
