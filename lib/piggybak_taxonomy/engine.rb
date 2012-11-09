require "ancestry"
require "rails_admin_nestable"

module PiggybakTaxonomy
  class Engine < ::Rails::Engine
    isolate_namespace PiggybakTaxonomy

    initializer "piggybak_taxonomy.rails_admin_config" do |app|
      RailsAdmin.config do |config|
        config.model PiggybakTaxonomy::NavigationNode do
          nestable_tree({ position_field: :position, max_depth: 3 })
          edit do
            field :title
            field :slug
          end
        end
      end
    end
  end
end
