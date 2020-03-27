# frozen_string_literal: true

# Maps Item entity to items table.
class Item < ApplicationRecord
  belongs_to :dish

  before_save :set_price
  before_update :set_price

  private

  def set_price
    self.price = dish.price * quantity
  end
end
