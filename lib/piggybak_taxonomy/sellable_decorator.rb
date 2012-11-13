module PiggybakTaxonomy
  module SellableDecorator
    extend ActiveSupport::Concern

    included do
      has_many :sellable_taxonomies, :class_name => "::PiggybakTaxonomy::SellableTaxonomy"
      has_many :navigation_nodes, :through => :sellable_taxonomies, :class_name => "::PiggybakTaxonomy::NavigationNode"
    end
  end
end
