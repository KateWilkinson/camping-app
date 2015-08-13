class AddVendorIdToSites < ActiveRecord::Migration
  def change
    add_reference :sites, :vendor, index: true, foreign_key: true
  end
end
