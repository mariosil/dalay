# frozen_string_literal: true

# Maps to dish table.
class Dish < ApplicationRecord
  has_one_attached :photo
end
