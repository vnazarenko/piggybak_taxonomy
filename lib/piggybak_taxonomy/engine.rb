require "ancestry"
require "rails_admin_nestable"
require "piggybak_taxonomy/sellable_decorator"

module PiggybakTaxonomy
  class Engine < ::Rails::Engine
    isolate_namespace PiggybakTaxonomy

    config.to_prepare do
      Piggybak::Sellable.send(:include, ::PiggybakTaxonomy::SellableDecorator)
      ApplicationController.class_eval do
        helper :piggybak_taxonomy
      end
    end

    initializer "piggybak_taxonomy.rails_admin_config" do |app|
      RailsAdmin.config do |config|
        config.model PiggybakTaxonomy::SellableTaxonomy do
          label "Sellables"
          edit do
            field :sellable
            field :sort
          end 
        end

        config.model PiggybakTaxonomy::NavigationNode do
          navigation_label "Extensions"
          label "Navigation Node"

          nestable_tree({ position_field: :position, max_depth: 3 })
          list do
            field :title
            field :slug
            field :full_path
          end
          edit do
            field :title
            field :slug
            field :sellable_taxonomies do
              active true
              label "Sellables"
            end
          end
        end
      end
    end
  end
end
