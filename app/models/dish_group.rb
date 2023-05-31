# frozen_string_literal: true

# Maps to dish_groups table.
class DishGroup < ApplicationRecord
  has_many :dishes
end
