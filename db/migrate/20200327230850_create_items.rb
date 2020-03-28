# frozen_string_literal: true

# Creates items table
class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.integer :quantity
      t.float :price
      t.belongs_to :dish
      t.belongs_to :order

      t.timestamps
    end
  end
end
