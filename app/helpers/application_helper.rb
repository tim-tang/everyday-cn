module ApplicationHelper
  def show_content(content)
    raw_html= simple_format(sanitize Redcarpet.new(content,:hard_wrap, :autolink, :no_intraemphasis).to_html).gsub("<br />","&nbsp;&nbsp;&nbsp;&nbsp;")
    return raw_html.gsub("large_","original_").gsub("www.everyday-cn.com","cms.everyday-cn.com")
  end

  def preview_content(content)
    #content.lines.grep(/\!\[\]\[([0-9])\]/) do |line|
    preview = content.clone
    preview.lines.grep(/\[([0-9])\]/) do |line|
      preview.gsub!(line,"")
    end
    return simple_format(truncate(preview.insert(0, "&nbsp;&nbsp;&nbsp;&nbsp;"), :length=>260))
  end

  def image_large(content)
    content.lines.grep(/http:/) do |line|
     if line.include?("[1]:")
        return line.gsub("[1]:","").gsub("www.everyday-cn.com","cms.everyday-cn.com").strip
     end
     return line.strip.slice(5,line.length)
    end
  end

  def render_blog_count(categoryId)
    @topics= Blog.get_blogs_by_category(categoryId)
    return @topics.size
  end

  def render_photo(photo, type)
     url = "http://cms.everyday-cn.com/system/pictures/#{photo.id}/#{type}_#{photo.avatar_file_name}"
     return url
  end

end
