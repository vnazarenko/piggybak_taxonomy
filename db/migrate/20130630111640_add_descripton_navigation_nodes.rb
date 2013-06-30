class AddDescriptonNavigationNodes < ActiveRecord::Migration
  def up
    add_column :navigation_nodes, :description, :text
  end

  def down
  end
end
