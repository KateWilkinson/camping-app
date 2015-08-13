class CreateSites < ActiveRecord::Migration
  def change
    create_table :sites do |t|
      t.string :name
      t.string :address
      t.string :town
      t.string :postcode
      t.text   :description
      t.integer :price

      t.timestamps null: false
    end
  end
end
