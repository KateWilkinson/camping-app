class ChangeSiteColumnNames < ActiveRecord::Migration
  def change
    rename_column :sites, :shared_toilets, :toilet_block
    rename_column :sites, :private_toilets, :ensuite_toilet
    rename_column :sites, :shared_shower, :shower_block
    rename_column :sites, :private_shower, :ensuite_shower
    rename_column :sites, :restaurant, :'on-site_restaurant'
    rename_column :sites, :shop, :'on-site_shop'
    rename_column :sites, :kitchen, :cooking_facilities
    rename_column :sites, :electricity, :charging_facilities
    rename_column :sites, :parking, :'on-site parking'
    rename_column :sites, :wifi, :wifi_available
    rename_column :sites, :handicap_access, :handicap_accessible
    rename_column :sites, :pets, :pets_welcome
    rename_column :sites, :family, :family_friendly
    rename_column :sites, :adults, :no_children
    rename_column :sites, :supermarket, :supermarket_nearby
    rename_column :sites, :eco, :eco_friendly
    rename_column :sites, :campfire, :campfires_allowed
    rename_column :sites, :bbq, :barbecues_allowed
    rename_column :sites, :budget, :towels_provided
    rename_column :sites, :backpacker, :laundry_facilities
    rename_column :sites, :remote, :remote_location
    rename_column :sites, :walking, :good_for_hiking
    rename_column :sites, :wildlife, :wildlife_haven
    rename_column :sites, :canoeing, :canoeing_nearby
    rename_column :sites, :climbing, :climbing_nearby
    rename_column :sites, :cycle_hire, :cycle_hire_nearby
    rename_column :sites, :cycling, :beach_nearby
    rename_column :sites, :horseriding, :horse_riding_nearby
    rename_column :sites, :sailing, :sailing_nearby
    rename_column :sites, :watersports, :watersports_nearby
    rename_column :sites, :pub, :pub_or_restaurant_nearby
  end
end
