class NavigationNodesSellables < ActiveRecord::Migration
  def change
    create_table :navigation_nodes_sellables, :id => false do |t|
      t.references :navigation_node
      t.references :sellable
    end
  end
end
