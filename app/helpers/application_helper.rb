# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def link_to_page(urlname)
    content = Content.find_by_urlname(urlname.urlname)
    content_tag(:a, content.name, :href => "/page/#{content.urlname}")
  end

#  def title
#    content_for :title do
#      url_hash = request.path_parameters()
#      case url_hash
#        when url_hash[:controller] == :main
#          "Общественное мнение, истина, прав ли я, споры, мнения, дебаты, мнение народа, коллективные споры"
#        else
#          "Общественное мнение, истина, прав ли я, споры, мнения, дебаты, мнение народа, коллективные споры"
#      end
#    end
#  end


end

