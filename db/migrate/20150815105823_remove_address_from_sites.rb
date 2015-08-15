class RemoveAddressFromSites < ActiveRecord::Migration
  def change
    remove_column :sites, :address, :string
  end
end
