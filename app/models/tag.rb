# frozen_string_literal: true

class Tag < ApplicationRecord
  belongs_to :product
  belongs_to :category
  delegate :name, to: :category, prefix: true
end
