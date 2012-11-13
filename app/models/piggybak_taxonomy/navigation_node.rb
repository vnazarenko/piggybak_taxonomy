module PiggybakTaxonomy
  class NavigationNode < ActiveRecord::Base
    self.table_name = "navigation_nodes"

    has_many :sellable_taxonomies, :class_name => "::PiggybakTaxonomy::SellableTaxonomy"
    has_many :sellables, :through => :sellable_taxonomies, :class_name => "::Piggybak::Sellable"
    accepts_nested_attributes_for :sellable_taxonomies, :allow_destroy => true
    attr_accessible :title, :slug, :position, :sellable_taxonomies_attributes #sellables_ids, :sellables

    validates_presence_of :title
    validates_presence_of :slug
 
    validates_format_of :slug, :with => /^[a-z_]+$/

    has_ancestry

    def nav_path
      "#{self.path.collect { |n| n.slug }.join('/')}"
    end
    def full_path
      "/n/#{self.nav_path}"
    end
  end
end
