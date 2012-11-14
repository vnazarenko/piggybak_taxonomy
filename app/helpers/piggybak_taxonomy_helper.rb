module PiggybakTaxonomyHelper
  def taxonomy_breadcrumb(object)
    if object.piggybak_sellable.navigation_nodes.any?
      render "piggybak_taxonomy/navigation/breadcrumb",
        :final_node => object.piggybak_sellable.navigation_nodes.first,
        :link_last => true
    else
      #do nothing
    end
  end

  def render_navigation(wrapper_ul = true, nested_uls = true)
    b = wrapper_ul ? "<ul>" : ""
    ::PiggybakTaxonomy::NavigationNode.all.select { |node| node.is_root? }.each do |node|
      b << navigation_tree(node, nested_uls)
    end
    b << "</ul>" if wrapper_ul
    b.html_safe
  end
  def navigation_tree(node, nested_uls)
    result = "<li class=\"depth#{node.depth}\">" + link_to(node.title, piggybak_taxonomy.piggybak_taxonomy_url(:path => node.nav_path))
    if node.children.any? 
      result << '<ul>' if nested_uls
      node.children.each do |child|
        result << navigation_tree(child, nested_uls)
      end
      result << '</ul>' if nested_uls
    end
    result << '</li>'
    result
  end
end
