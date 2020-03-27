# frozen_string_literal: true

# Create dish table.
class CreateDishes < ActiveRecord::Migration[6.0]
  def change
    create_table :dishes do |t|
      t.string :name
      t.string :description

      t.belongs_to :dish_group
      t.belongs_to :restaurant

      t.timestamps
    end
  end
end
