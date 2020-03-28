# frozen_string_literal: true

# Maps Order entity to oerders table.
class Order < ApplicationRecord
  belongs_to :restaurant

  has_many :items
end
