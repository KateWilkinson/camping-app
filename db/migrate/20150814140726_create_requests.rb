class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.string :customer_name
      t.string :customer_email
      t.string :customer_phone
      t.date :start_date
      t.date :end_date
      t.string :comments

      t.timestamps null: false
    end
  end
end
