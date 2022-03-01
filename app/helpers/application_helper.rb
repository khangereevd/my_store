module ApplicationHelper

  def urls_to_images(str)
    str.gsub!(/(https:\/\/.*?\.(png|jpg))/, '<p><img src="\1"/></p>')
    str.html_safe
  end

  def urls_to_links(s)
    s.gsub! /\s(http:\/\/.*?)\s/, '<a href="\1">\1</a>'
    s.html_safe
  end

end
