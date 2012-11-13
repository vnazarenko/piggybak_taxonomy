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
end
