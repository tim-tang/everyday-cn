module ApplicationHelper
  def load_content(content)
    sanitize Redcarpet.new(content,:hard_wrap, :autolink, :no_intraemphasis).to_html
  end

  def preview_content(content)
    #content.lines.grep(/\!\[\]\[([0-9])\]/) do |line|
    preview = content.clone
    preview.lines.grep(/\[([0-9])\]/) do |line|
      preview.gsub!(line,"")
    end
    return preview
  end

  def image_large(content)
    content.lines.grep(/http:/) do |line|
     if line.include?("[1]:")
        return line.gsub("[1]:","").strip
     end
     return line.strip.slice(5,line.length)
    end
  end


end
