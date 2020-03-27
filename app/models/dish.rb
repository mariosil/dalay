# frozen_string_literal: true

# Maps to dish table.
class Dish < ApplicationRecord
  belongs_to :dish_group
  belongs_to :restaurant

  has_one_attached :photo
end
