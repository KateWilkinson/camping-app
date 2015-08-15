class ChangeColumn < ActiveRecord::Migration
  def change
    change_column :sites, :shared_toilets, :boolean, :default => false
    change_column :sites, :private_toilets, :boolean, :default => false
    change_column :sites, :shared_shower, :boolean, :default => false
    change_column :sites, :private_shower, :boolean, :default => false
    change_column :sites, :restaurant, :boolean, :default => false
    change_column :sites, :shop, :boolean, :default => false
    change_column :sites, :kitchen, :boolean, :default => false
    change_column :sites, :electricity, :boolean, :default => false
    change_column :sites, :parking, :boolean, :default => false
    change_column :sites, :handicap_access, :boolean, :default => false
    change_column :sites, :wifi, :boolean, :default => false
    change_column :sites, :pets, :boolean, :default => false
    change_column :sites, :family, :boolean, :default => false
    change_column :sites, :adults, :boolean, :default => false
    change_column :sites, :supermarket, :boolean, :default => false
    change_column :sites, :eco, :boolean, :default => false
    change_column :sites, :campfire, :boolean, :default => false
    change_column :sites, :bbq, :boolean, :default => false
    change_column :sites, :budget, :boolean, :default => false
    change_column :sites, :backpacker, :boolean, :default => false
    change_column :sites, :forest, :boolean, :default => false
    change_column :sites, :lake, :boolean, :default => false
    change_column :sites, :mountain, :boolean, :default => false
    change_column :sites, :peaceful, :boolean, :default => false
    change_column :sites, :remote, :boolean, :default => false
    change_column :sites, :scenic, :boolean, :default => false
    change_column :sites, :walking, :boolean, :default => false
    change_column :sites, :wildlife, :boolean, :default => false
    change_column :sites, :canoeing, :boolean, :default => false
    change_column :sites, :climbing, :boolean, :default => false
    change_column :sites, :cycling, :boolean, :default => false
    change_column :sites, :cycle_hire, :boolean, :default => false
    change_column :sites, :horseriding, :boolean, :default => false
    change_column :sites, :sailing, :boolean, :default => false
    change_column :sites, :watersports, :boolean, :default => false
    change_column :sites, :pub, :boolean, :default => false
  end
end
