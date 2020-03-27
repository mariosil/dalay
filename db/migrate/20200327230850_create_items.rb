# frozen_string_literal: true

# Creates items table
class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.integer :quantity
      t.float :price
      t.references :dish, null: false, foreign_key: true

      t.timestamps
    end
  end
end
