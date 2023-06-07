# frozen_string_literal: true

# Maps to dish table.
class Dish < ApplicationRecord
  belongs_to :dish_group
  belongs_to :restaurant

  has_one_attached :photo

  scope :by_dish_group, -> (dish_group) { where(dish_group: dish_group) }
end
