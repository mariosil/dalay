# frozen_string_literal: true

# Creates restaurant table.
class CreateRestaurants < ActiveRecord::Migration[6.0]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.text :description
      t.string :address
      t.string :phone

      t.timestamps
    end
  end
end
