# frozen_string_literal: true

# Create dish_groups table.
class CreateDishGroups < ActiveRecord::Migration[6.0]
  def change
    create_table :dish_groups do |t|
      t.string :name

      t.timestamps
    end
  end
end
