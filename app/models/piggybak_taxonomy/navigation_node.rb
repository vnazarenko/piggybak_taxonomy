module PiggybakTaxonomy
  class NavigationNode < ActiveRecord::Base
    self.table_name = "navigation_nodes"

    attr_accessible :title, :slug, :position

    validates_presence_of :title
    validates_presence_of :slug
 
    validates_format_of :slug, :with => /^[a-z_]+$/

    has_ancestry

    def full_path
      "parents + #{self.slug}"
    end
  end
end
