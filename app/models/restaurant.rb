# frozen_string_literal: true

# Maps to restaurant table.
class Restaurant < ApplicationRecord
  has_many :dishes

  has_one_attached :logo
end
