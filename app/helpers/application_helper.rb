# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def link_to_page(urlname)
    content = Content.find_by_urlname(urlname.urlname)
    content_tag(:a, content.name, :href => "/page/#{content.urlname}")
  end
end

