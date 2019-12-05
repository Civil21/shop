# frozen_string_literal: true

class Order < ApplicationRecord
  belongs_to :user
  belongs_to :product
  after_create :set_cost

  def set_cost
    cost = product.price * count
  end

  scope :active, -> { where(state: 'active') }
  scope :ordered, -> { where(state: %w[order sent]) }
  scope :old, -> { where(state: %w[canceled delivered]) }
end
