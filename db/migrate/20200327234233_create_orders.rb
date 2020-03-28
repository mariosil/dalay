class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.datetime :date
      t.float :sub_total
      t.float :taxes
      t.float :total
      t.references :restaurant, null: false, foreign_key: true

      t.timestamps
    end
  end
end
